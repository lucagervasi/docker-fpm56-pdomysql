FROM php:5.6-fpm-alpine

RUN apk --update --no-cache add nodejs git libpng libpng-dev jpeg jpeg-dev libmcrypt libmcrypt-dev

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install gd
RUN docker-php-ext-install mcrypt

ADD docker-compose-installer.php /i.php
RUN php /i.php --quiet  --install-dir=/usr/bin --filename=composer

RUN apk --update --no-cache del libpng-dev jpeg-dev libmcrypt-dev
