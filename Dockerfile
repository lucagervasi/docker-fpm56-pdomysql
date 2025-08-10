FROM php:8.4-fpm-alpine

# Install persistent dependencies
RUN apk --no-cache add \
    git \
    nodejs \
    npm \
    freetype \
    libjpeg-turbo \
    libpng

# Install build dependencies, php extensions, and then remove build dependencies
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS build-base freetype-dev libjpeg-turbo-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo_mysql \
    && apk del .build-deps

# Install Composer
COPY docker-compose-installer.php /i.php
RUN php /i.php --quiet --install-dir=/usr/bin --filename=composer && rm /i.php

# Clean up apk cache
RUN rm -rf /var/cache/apk/*
