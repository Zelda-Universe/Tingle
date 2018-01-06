# Install
  * Download project from GitHub at this URL: `https://github.com/Zelda-Universe/Zelda-Maps`.
  * Set-up Dependencies
    * Set-up database
      * Install and configure database connection
      * Catch the new, randomly generated root account's password during the installation.
      * Add `/usr/local/mysql/bin` to user path variable.
      * `mysql_secure_installation`
      * A separate account is recommended to only read the related database schemas, so add an account for this project to use.
        * `mysql -u root -p -e "CREATE USER 'zmaps'@'localhost' IDENTIFIED BY '<password>'"`
      * Import the `dev/db/zelda_maps.sql` file.
        * `mysql -u root -p zelda_maps < "dev/db/zelda_maps.sql"`
      * Grant the new db user all schema privileges to the newly imported `zelda_maps` schema.
        * ``mysql -u root -p -e "GRANT ALL PRIVILEGES ON `zelda_maps`.* to 'zmaps'@'localhost'"``
      * `cp .env.example .env`
      * Edit the newly copied `.env` file to your database's parameters for connection location and account credentials.
    * Set-up web server
      * Note: I used `nginx` on a Mac.  I heard you can use [MAMP](https://www.mamp.info), and probably [WAMP](wampserver.com/en/) too.
      * Install through homebrew: `brew install nginx`.
      * Generate SSL certificates: `openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -keyout /usr/local/etc/nginx/nginx.key -out /usr/local/etc/nginx/nginx.crt`
      * `cp Zelda-Maps.conf.example Zelda-Maps.conf`
      * Edit the newly copied `Zelda-Maps.conf` file to modify the `$project_location` line appropriately.
      * `ln -s (readlink -f ZM_nginx.conf) /usr/local/etc/nginx/servers/Zelda-Maps.conf`
      * `nginx -p /usr/local/var`
      * Tell the Mac OS to "Allow network connections" when the dialog automatically appears.
    * Enable PHP support
      * `brew install homebrew/php/php56-xdebug`
      * In `/usr/local/etc/php-fpm.conf` add this line: `listen = /usr/local/var/run/php5-fpm.sock`
      * `php-fpm --prefix /usr/local`
    * PHP dependencies
      - Run `composer install`.
  * Import this Git Flow configuration
    ```
    [gitflow "branch"]
    	master = production
    	develop = development
    [gitflow "prefix"]
    	feature = feature/
    	release = release/
    	hotfix = hotfix/
    	support = support/
    	versiontag =
    ```
