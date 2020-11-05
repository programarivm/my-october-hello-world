## My October

Creates a basic OctoberCMS app -- the OctoberCMS demo -- using PHP 7.4 and Nginx 1.18.

## How-to Guide

Build the Docker containers:

    $ docker-compose up --build

Create a new OctoberCMS project as a non-root user:

    $ docker exec -itu 1000:1000 myoctober_php_fpm composer create-project october/october myoctober

Move the project into the root's current directory:

    $ mv -v {myoctober/*,myoctober/.*} .

Remove the remaining empty folder:

    $ rm -rf myoctober

Make sure to set up permissions properly:

    $ sudo chmod 775 -R storage
    $ sudo chown -R standard:www-data storage    

Finally, find out the IP of your `myoctober_nginx` container:

    $ echo $(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' myoctober_nginx)

Congrats! With the IP at hand browse your new site -- e.g. `http://172.23.0.3`.
