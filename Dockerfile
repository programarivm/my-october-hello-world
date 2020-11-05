FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    git \
    libpng-dev \
    libzip-dev \
    zip \
    unzip

RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.10.17
