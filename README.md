# slim_app

This repository builds a docker image for running web apps written in php with the Slim framework

This starts with [alpine_neovim](https://github.com/cskeeters/alpine_neovim) which has a configured bash and vim.

# Build

    make

# Install Modules with Composer

    make bash
    composer install

# Usage

To see how to use this program, see [cskeeters/waldenpoint_www](https://github.com/cskeeters/waldenpoint_www).

# Detail

* Starts from [Alpine Linux](https://www.alpinelinux.org/)
* Adds [php 8.1](https://www.php.net/) with intl.so (supports ext-intl)
    * Includes simplexml php extension (Required for Slim-Http)
    * Includes fileinfo php extension (Required for Slim-Http)
* Adds [php-fpm](https://www.php.net/manual/en/install.fpm.php)
* Adds [nginx](https://www.nginx.com/)
* Adds [composer](https://getcomposer.org/)
* Adds [supervisor](http://supervisord.org/) for running nginx and php-fpm in one container
* Adds bash with ll alias
* Adds vim
* Configured to use ./app as volume in /var/www/app
* `init.sh` script enables the container to be used for different functions

# Motivation

* This enables me to have a single container to run a php web application
* The version of php and composer come from the Alpine package repository so they are tested to work
* I can inspect the container with bash
