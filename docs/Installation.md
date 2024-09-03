# Install
  * Download project from GitHub at this URL: `https://github.com/Zelda-Universe/Zelda-Maps-Website`.
  * Set-up Dependencies (for viewing/operating/executing)
    * Set-up database
      * If refreshing using the project's stored samples, issue this command after careful consideration:
        * ``echo 'DROP DATABASE IF EXISTS `zeldamaps`' | ./dev/db/command.fish``
        * If you are also having problems with the user accounts, you can run also this SQL query, and then use the install script instead:
          * ``DROP USER IF EXISTS 'zeldamaps'@'localhost', 'zeldamaps-manage'@'localhost'``
        * and then this script for the remaining project-specific tasks:
          * `dev/db/prepare.fish refreshAll`
      * Install and configure a database connection for this project.
        * https://dev.mysql.com/doc/mysql-installation-excerpt/8.0/en/
          * Linux
            * MariaDB
              ```
                > docker create   \
                  --name mariadb  \
                  --env MYSQL_ROOT_PASSWORD=(read -s -P 'Root Password: ') \
                  -v '/etc/mysql:/etc/mysql'            \
                  -v '/var/lib/mysql:/var/lib/mysql'    \
                  -v '/var/run/mysqld:/var/run/mysqld'  \
                  -v '/srv/nginx:/srv'                  \
                  mariadb:10.1.21
                ;
              ```
                * `sudo chmod -R 777 /var/run/mysqld`
                  * May need to be run every container start..
                  * TODO: Fix in docker volume syntax?  Additional colon and options?
            * MySQL
              * https://dev.mysql.com/doc/mysql-installation-excerpt/8.0/en/linux-installation-native.html
              * `sudo dnf install community-mysql-server`
              * `sudo systemctl start mysqld`
      * Setup project local backend PHP config parameters:
        * `cp .env.example .env`
        * Edit the newly copied `.env` file to your database's parameters for connection location and account credentials.
      * Install recommended GUI editor/IDE
        * https://dbeaver.io/download/
          * Community edition
        * https://github.com/Sequel-Ace/Sequel-Ace
          * https://github.com/sequelpro/sequelpro/issues/2485#issuecomment-1403679595
        * https://dev.mysql.com/downloads/workbench/
      * Perform secure database set-up tasks:
        * Catch the new, randomly generated root account's password during the installation.
        * Windows/Cygwin?: Add `/usr/local/mysql/bin` to user path variable.
        * `mysql_secure_installation`
          * Recommended settings
            * Password validation: `y`, `2` (strong)
            * Remove anonymous users: `y`
            * Force root local only: `y`
            * Remove test database: `y`
            * Reload privs: `y`
      * Perform specific project database set-up tasks:
        * `alias -s js-yaml (readlink -e node_modules/.bin/js-yaml)`
        * `dev/db/prepare.fish install`
          * Create the database using a root account.
          * Create a dedicated basic account
            * It is recommended to only read and perform other basic functions to the related database schema(s) as a less privileged database account for this project to use.
            * For mysql, `mysql_config_editor` to create and store local, default, client credentials may be recommended, especially when contacting different project-related servers.
          * Grant the new db user all or some schema privileges to the newly imported `zeldamaps` schema.
          * Specific schema privileges
          * or all (not recommended).
          * Possibly do the same for a development DB management account too.
      * Import the sample database files, hopefully using the specific management account.
    * Set-up web server
      * Linux:
        * Nginx:
          * Creation:
            * Docker:
              * Simple:
                * https://hub.docker.com/_/nginx#How_to_use_this_image
              * Multi-site:
                * Initial load:
                  * May need to replace a docker create volume set of options with `-v '/etc/nginx:/etc/nginx-host'` temporarily at first (if you have never used this process before, and don't have recent copies of a working, default, nginx configuration), then copy out the default configuration, then remove and proceed with the direct directory mapping next for the normal container creation.
                    * You could also just use `-v '/etc/nginx/conf.d:/etc/nginx/conf.d'`.
                      * You might see errors looking for `default.html` if you don't copy out that file for this location.
                * ```
                  docker create   \
                    --name nginx  \
                    -p 80:80      \
                    -v '/etc/nginx:/etc/nginx'                  \
                    -v '/var/log/nginx:/var/log/nginx'          \
                    -v '/srv/nginx:/srv'                        \
                    -v '/usr/local/var/run:/usr/local/var/run'  \
                    nginx         \
                  ;
                  ```
          * Compile:
            * https://www.php.net/distributions/
              * Current servers running 7.0.33.
              * Using 7.4.33.
            * https://www.nginx.com/resources/wiki/start/topics/examples/phpfcgi/
            * Or: https://askubuntu.com/questions/134666/what-is-the-easiest-way-to-enable-php-on-nginx
          * Manual
            * Packages:
              * `sudo dnf install nginx php-fpm php-mysqlnd`
                * https://www.php.net/manual/en/mysqli.installation.php
            * `sudo mkdir -p /etc/nginx`
            * `sudo systemctl start php-fpm nginx`
          * Configuration:
            * Add `/etc/hosts` line:
              * `127.0.0.1 zeldamaps`
            * SSL Preparation, if working:
              * `sudo openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -keyout /etc/nginx/conf.d/zeldamaps.key -out /etc/nginx/conf.d/zeldamaps.crt`
            * `cp dev/server/nginx/site.conf.example dev/server/nginx/site.conf`
            * `sed -i -r 's|(\s+set \$project_location ).+$|\1'(readlink -f .)';|' dev/server/nginx/site.conf`
            * Could use `unix:/` socket instead of network pass.
            * `sudo ln -s /srv/ZU/Zelda-Maps-Website/dev/server/nginx/site.conf /etc/nginx/conf.d/Zelda-Maps.conf`
          * Check for failures:
            * `sudo systemctl status nginx`
              * open failed for site conf file
                * Either used the wrong path when symlinking,
                * Or SELinux problem:
                  * Copy relevant error line.
                  * `xclip -out | audit2why`
                  * `xclip -out | audit2allow`
                  * `sudo semodule -i dev/server/nginx/selinux/httpd-dosfs_read-open.pp/`
            * `sudo systemctl status php-fpm`
              * May require additional permissions to connect to network address and port for database communication.
                * Using the local Linux socket route works with additional configuration.
            * SSL/TLS/HTTPS does not seem to work with the container.
              * May still be recommended when the container can ease deployment for use in more important contexts.
              * `sslscan` could be used to help investigate and solve problems fixing this configuration.
              * For now, version `2.0.6-static` showed the container using OpenSSL 1.1.1g, and all features not suppored, disabled, or failed.
        * PHP-FPM/-CGI
          * Creation:
            * Docker:
              * Initial load:
                * May need to replace a docker create volume set of options with `-v '/usr/local/etc/php7:/usr/local/etc-php-host'` temporarily at first (if you have never used this process before, and don't have recent copies of a working, default, nginx configuration), then copy out the default configuration, then remove and proceed with the direct directory mapping next for the normal container creation.
              * ```
                docker create --name php7 \
                  -v '/usr/local/etc/php7:/usr/local/etc'         \
                  -v '/usr/local/var/run/php7:/usr/local/var/run' \
                  -v '/var/run/mysqld:/var/run/mysqld'            \
                  -v '/srv/nginx:/srv'    \
                  php:7.4.33-fpm          \
                ;
                ```
              * Configuration:
                * `sudo chown -R <user>:<user> /usr/local/etc/php7`
                * `sudo chmod 666 /usr/local/var/run/php7/php-fpm.sock`
                * `php-fpm.d/www.conf`
                  * Lines 36-37: ```
                    ; listen = 127.0.0.1:9000
                    listen = /usr/local/var/run/php-fpm.sock
                    ```
                  * Line 51: `listen.mode = 0666`
                * `php-fpm.d/zz-docker.conf`
                  * Lines 4-5: ```
                    ;[www]
                    ;listen = 9000
                    ```
                * `cd '/srv/ZU/Zelda-Maps-Website/'`
                * `chgrp 33 .`
                * `chmod g+w .`
      * Mac:
        * nginx or [MAMP](https://www.mamp.info)
        * Install through Homebrew: `brew install nginx`.
        * Generate SSL certificates: `openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -keyout /usr/local/etc/nginx/nginx.key -out /usr/local/etc/nginx/nginx.crt`
        * `cp dev/server/nginx/site.conf.example dev/server/nginx/site.conf`
        * Edit the newly copied `site.conf` file to modify the `$project_location` line appropriately to the root of this project's source tree, and the `fastcgi_pass` directive according to your platform.
          * See if this works: `sed -i -r 's|(\s+set \$project_location ).+$|\1'(readlink -f .)';|' dev/server/nginx/site.conf`
          * `unix:/` for *nix/bsd platforms, IP and port for Windows or in general.
        * `ln -s (readlink -f dev/server/nginx/site.conf) /usr/local/etc/nginx/servers/Tingle.conf`
        * `nginx -p /usr/local/var`
        * Enable PHP FPM (Similar to FastCGI?)
          * `brew install homebrew/php/php56-xdebug`
          * In `/usr/local/etc/php-fpm.conf` add this line: `listen = /usr/local/var/run/php5-fpm.sock`
          * `php-fpm --prefix /usr/local`
        * Tell the Mac OS to "Allow network connections" when the dialog automatically appears.
      * Windows:
        * nginx or [WAMP](wampserver.com/en/)
        * https://nginx.org/en/docs/windows.html
        * Manual Install:
          * https://nginx.org/en/download.html
          * Probably recommend stable instead of mainline/latest/development.
            * https://smarttechnicalworld.com/how-to-install-nginx-on-windows/
        * Generate SSL certificates: `openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -keyout <nginx_app_dir_path>/conf/nginx.key -out <nginx_app_dir_path>/conf/nginx.crt`
        * `mv <nginx_app_dir_path>/conf/nginx.conf <nginx_app_dir_path>/conf/nginx.conf.orig`
        * `cp dev/server/nginx/root.conf <nginx_app_dir_path>/conf/nginx.conf`
        * `cmd /C mklink /H "<nginx_app_dir_path>\conf\servers\Tingle.conf" (cygpath -w (readlink -f site.conf))`
        * Enable PHP FastCGI
          * Install PHP NTS zip
            * https://windows.php.net/download/
          * `php-cgi -b 127.0.0.1:9999`
        * Tell the Windows OS to "Allow network connections" when the dialog automatically appears.
    * PHP dependencies
      * Mysqli
        * Docker
          * `docker exec php7 docker-php-ext-install mysqli`
            * https://hub.docker.com/_/php/#How_to_install_more_PHP_extensions
        * Manual
          * Now the mysqlnd package?
          * (Old?) Make sure it is enabled in `php.ini`.  Just uncomment the extension line most likely.
      * Optional: Install php zend extension xdebug
        * https://xdebug.org/wizard
        * https://stackify.com/php-debugging-guide/
          * Download
            * https://xdebug.org/docs/install#windows
          * Install
            * Copy to PHP ext directory
          * Configure
            * Add mentioned directives with the appropriate path to `php.ini`.
      * Composer
        * Install
          * Mac:
            * Homebrew?
          * Windows:
            * https://getcomposer.org/download/
      * Run `composer install`.
    * Configure project
      - Make any other necessary changes in the `.env` file, say, configuring mail system parameters.
    * (Optional) Create map tile images locally
      - In case you want to host them locally, either for wanting to work offline, or at least just easing the load on the public server, you can finally do so with some scripts I've included now.
        - Mainly you can run this other script to generate the tile images for all configured games' maps.
          + All you need to do is include a single source image in that double-nested directory structure.  You can most likely grab these from our content repository.
          + and then run this command: `dev/generateAllMapTiles.fish`
          + This runs the individual script `dev/generateMapTiles.fish` with that setting, a source file argument, and an output directory argument.  You can call this individually if you need to for any reason, local to the project or not.
        - This debug script was first since I didn't know how to generate the tile images correctly from a master and being cropped, so this generates each individually based on predetermined quadrant and zoom input parameters.
          + `mkdir -p markers/debug/test`
          + `env outputZoomFolders=true dev/generateDebugTiles.fish markers/debug/test`
          + This script can serve as a nice template for any potential future use.
        - Note I've been including an additional, non-default parameter for these sample script invocations.  Right now, We keep all tiles in one directory, but it may be helpful to transition to using nested zoom folders.
  * Coding Workflow (for development)
    * Import this Git Flow configuration:
      * ```
        [gitflow "branch"]
        	master = master
        	develop = development
        [gitflow "prefix"]
        	feature = feature/
        	release = release/
        	hotfix = hotfix/
        	support = support/
        	versiontag =
        ```
    * Install database migration creation framework tool, and run it.
      * Install Ruby and its development header files too.
        * I used 2.4.1/3.2.2.
        * I chose `ruby.x86_64` and `ruby-devel.x86_64` using Fedora, and received this list as remaining required dependencies:
          * `ruby-default-gems.noarch`
          * `ruby-libs.x86_64`
          * `rubygem-bigdecimal.x86_64`
          * `rubygem-bundler.noarch`
          * `rubygem-io-console.x86_64`
          * `rubygem-json.x86_64`
          * `rubygem-psych.x86_64`
          * `rubygem-rdoc.noarch`
          * `rubygems.noarch`
          * `rubypick.noarch`
        * Should include bundler, doc, and basic/default gemset for your OS distribution.
         * bundler
          * 1.16.1/2.4.20
          * To update:
            * `sudo bundle update --bundler`
      * Install/Update RubyGems
        * https://rubygems.org/pages/download
        * I used 2.6.11/3.4.20.
          * `gem update --system`
      * Install the migration tool, and its dependencies
        * Note: If you use Cygwin or other Linux-like environments like msys2 or mingw, be careful that they don't interfere with gems that require native installation at least like nokogiri, but also possibly mysql2 as well.
          * I removed the Cygwin ruby package and installed the native Windows one using the installer that bundles the 'devkit' to help.  Then I had some stray `gem`, `rake`, and `*mingw*` commands in my Cygwin environment possibly without a proper package, so I just removed them, and also made fish functions to call them by their Windows-style paths.  I stopped getting install errors after that like configure with an `*-ar` executable, failed to apply a patch by not finding a file that is actually there, etc.
          * `gem install nokogiri -v 1.10.1 --platform=ruby`
          * Mysql2 was then having more unique issues..  I had to figure that out and issue a crazy command like this:
            * `gem install mysql2 -v 0.5.2 --platform=ruby -- --with-mysqlclient-dir="C:/Program Files/MySQL/MySQL Server 8.0/bin" --with-mysql-rpath="C:/Program\ Files/MySQL/MySQL\ Server\ 8.0/lib"`
        * The individual way
          * `gem install mysql2`
            * 0.5.2/0.5.5
          * `gem install standalone_migrations`
            * 5.2.5/7.1.2
            * You might need my edited version of the repository instead.
          * https://github.com/Pysis868/standalone-migrations
          * As of commit `685d343752a1b42ff844b5a75677db7e4acf8a36`.
          * It fixes a particular issue when running several of the commands, but doesn't pass several tests O_o.
          * Some commands might not work, but the main ones I have used so far only print a stack trace for the error, but still work.
        * The automatic way
          * Install/Update the 2 troublesome gems above in the note manually first.
          * `gem install bundler` (2.4.10)
            * `bundle update standalone_migrations`
          * `bundle install`
        * `dev/db/config.yml.example dev/db/config.yml`
          * Configure like the `.env` file, but use a different account that is more privileged for managing the database.
            * Hopefully never using the `root` in a script, so just make another similar to the first one made for the project, use a different password, and add these additional permissions: `ALTER, CREATE, CREATE TEMPORARY TABLES, DELETE, DROP, INSERT, LOCK TABLES, REFERENCES, INDEX`.
              * `PROCESS` is also needed for the export script, and is a global privilege.
            * This set could be reduced, but it's what I chose for now..
          * Note which environment you are configuring for and use the appropriate section.
          * May only need to modify the password, and if not, also the database and/or username fields as well.
        * Migrate database
          * `rake db:migrate`
