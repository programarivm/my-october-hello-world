## My October -- Hello World

Creates a basic OctoberCMS app -- the OctoberCMS demo -- using PHP 7.4, Nginx 1.18 and MySQL 8.0.

## How-to Guide

Create an `.env` file:

    $ cp .env.example .env

Build the Docker containers:

    $ docker-compose up --build

Create a new project as a non-root user:

    $ docker exec -itu 1000:1000 myoctober_php_fpm composer create-project october/october myoctober

Move the project into the root's current directory:

    $ mv -v {myoctober/*,myoctober/.*} .

Remove the remaining empty folder:

    $ rm -rf myoctober

Make sure to set up permissions properly:

    $ sudo chmod 775 -R plugins storage themes
    $ sudo chown -R standard:www-data plugins storage themes

Find out the IP of your `myoctober_mysql` container and update your `.env` file accordingly:

    $ echo $(docker inspect -f '{{range .NetworkSettings.Networks}}{{.Gateway}}{{end}}' myoctober_mysql)

Install and set up October:

    sudo docker exec -it myoctober_php_fpm php artisan october:install

Finally, find out the IP of your `myoctober_nginx` container:

    $ echo $(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' myoctober_nginx)

Congrats! With the IP at hand browse your new site -- e.g. http://172.23.0.3 -- and log in the admin panel.
