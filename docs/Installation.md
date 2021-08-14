# Install
  * Download project from GitHub at this URL: `https://github.com/Zelda-Universe/Tingle`.
  * Set-up Dependencies
    * Set-up database
      * Install and configure a database connection for this project.
      * Perform the usual and secure database set-up steps:
        * Catch the new, randomly generated root account's password during the installation.
        * Add `/usr/local/mysql/bin` to user path variable.
        * `mysql_secure_installation`
        * The `mysql_config_editor` to create and store local, default, client credentials may be recommended, especially when contacting different project-related servers.
        * A separate account is recommended to only read the related database schemas, so add a less privileged database account for only this project to use:
          * `mysql --login-path=local -e "CREATE USER 'tingle'@'localhost' IDENTIFIED BY '<password>'"`
      * Import the `dev/db/tingle.sql` file.
        * `mysql --login-path=local < "dev/db/tingle.sql"`
      * Grant the new db user all or some schema privileges to the newly imported `tingle` schema.
        * All: ``mysql --login-path=local -e "GRANT ALL PRIVILEGES ON `tingle`.* to 'tingle'@'localhost'"``
        * Specific Schema Privileges: `SELECT, INSERT, UPDATE, DELETE`.
      * Setup project local backend PHP config parameters:
        * `cp .env.example .env`
        * Edit the newly copied `.env` file to your database's parameters for connection location and account credentials.
    * Set-up web server
      * Mac:
        * nginx or [MAMP](https://www.mamp.info)
        * Install through homebrew: `brew install nginx`.
        * Generate SSL certificates: `openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -keyout /usr/local/etc/nginx/nginx.key -out /usr/local/etc/nginx/nginx.crt`
        * `cp site.conf.example site.conf`
        * Edit the newly copied `site.conf` file to modify the `$project_location` line appropriately to the root of this project's source tree, and the `fastcgi_pass` directive according to your platform.
          * `unix:/` for *nix/bsd platforms, IP and port for Windows or in general.
        * `ln -s (readlink -f ZM_nginx.conf) /usr/local/etc/nginx/servers/Zelda-Maps.conf`
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
        * Make sure it is enabled in `php.ini`.  Just uncomment the extension line most likely.
      * Optional: Install php zend extension xdebug
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
  * Coding Workflow
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
      * Install Ruby
        * I used 2.4.1/.
      * Install RubyGems
        * https://rubygems.org/pages/download
        * I used 2.6.11/.
      * Install the migration tool, and its dependencies
        * Note: If you use Cygwin or other Linux-like environments like msys2 or mingw, be careful that they don't interfere with gems that require native installation at least like nokogiri, but also possibly mysql2 as well.
          * I removed the Cygwin ruby package and installed the native Windows one using the installer that bundles the devkit to help.  Then I had some stray `gem`, `rake`, and `*mingw*` commands in my Cygwin environment possibly without a proper package, so I just removed them, and also made fish functions to call them by their Windows-style paths.  I stopped getting install errors after that like configure with an `*-ar` executable, failed to apply a patch by not finding a file that is actually there, etc.
          * `gem install nokogiri -v 1.10.1 --platform=ruby`
          * Mysql2 was then having more unique issues..  I had to figure that out and issue a crazy command like this:
            * `gem install mysql2 -v 0.5.2 --platform=ruby -- --with-mysqlclient-dir="C:/Program Files/MySQL/MySQL Server 8.0/bin" --with-mysql-rpath="C:/Program\ Files/MySQL/MySQL\ Server\ 8.0/lib"`
        * The individual way
          * `gem install mysql2`
            * 0.5.2
          * `gem install standalone_migrations`
            * 5.2.5
            * You might need my edited version of the repository instead.
          * https://github.com/Pysis868/standalone-migrations
          * As of commit `685d343752a1b42ff844b5a75677db7e4acf8a36`.
          * It fixes a particular issue when running several of the commands, but doesn't pass several tests O_o.
          * Some commands might not work, but the main ones I have used so far only print a stack trace for the error, but still work.
        * The automatic way
          * Install the 2 troublesome gems above in the note manually first.
          * `gem install bundler`
          * `bundle install`
        * `dev/db/config.yml.example dev/db/config.yml`
          * Configure like the `.env` file, but use a different account that is more privileged for managing the database.
            * Hopefully never using the `root` in a script, so just make another similar to the first one made for the project, use a different password, and add these additional permissions: `ALTER, CREATE, CREATE TEMPORARY TABLES, DELETE, DROP, LOCK TABLES, REFERENCES, INDEX`.
              * `PROCESS` is also needed for the export script, and is a global privilege.
            * This set could be reduced, but it's what I chose for now..
          * Note which environment you are configuring for and use the appropriate section.
          * May only need to modify the password, and if not, also the database and/or username fields as well.
        * Migrate database
          * `rake db:migrate`
