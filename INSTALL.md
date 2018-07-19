# Install
  * Download project from GitHub at this URL: `https://github.com/Zelda-Universe/Zelda-Maps`.
  * Set-up Dependencies
    * Set-up database
      * Install and configure database connection
      * Catch the new, randomly generated root account's password during the installation.
      * Add `/usr/local/mysql/bin` to user path variable.
      * `mysql_secure_installation`
      * The `mysql_config_editor` to create and store local, default, client credentials may be recommended, especially when contacting different project-related servers.
      * A separate account is recommended to only read the related database schemas, so add an account for this project to use.
        * `mysql --login-path=local -e "CREATE USER 'zmaps'@'localhost' IDENTIFIED BY '<password>'"`
      * Import the `dev/db/zeldamaps.sql` file.
        * `mysql --login-path=local < "dev/db/zeldamaps.sql"`
      * Grant the new db user all schema privileges to the newly imported `zeldamaps` schema.
        * ``mysql --login-path=local -e "GRANT ALL PRIVILEGES ON `zeldamaps`.* to 'zmaps'@'localhost'"``
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
    * Configure project
      - Make any other necessary changes in the `.env` file, say, configuring mail system parameters.
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
        * I was using 2.4.1.
      * Install RubyGems
        * https://rubygems.org/pages/download
        * Used 2.6.11
      * Install the migration tool, and its dependencies
        * The individual way
          * `gem install mysql2`
            * 0.5.1
          * `gem install standalone_migrations`
            * 5.2.5
            * You might need my edited version of the repository instead.
          * https://github.com/Pysis868/standalone-migrations
          * As of commit `685d343752a1b42ff844b5a75677db7e4acf8a36`.
          * It fixes a particular issue when running several of the commands, but doesn't pass several tests O_o.
          * Some commands might not work, but the main ones I have used so far only print a stack trace for the error, but still work.
        * The automatic way
          * `gem install bundler`
          * `bundle install`
        * `dev/db/config.yml.example dev/db/config.yml`
          * Configure like the `.env` file.
          * Note which environment you are configuring for and use the appropriate section.
          * May only need to modify the password, and if not, also the database and/or username fields as well.
          * Migrate database
            * `rake db:migrate`
