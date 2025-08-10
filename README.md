# docker-php84-fpm

This repository contains a `Dockerfile` to build a PHP 8.4 FPM image based on Alpine Linux.

## Features

*   PHP 8.4 FPM
*   Based on Alpine Linux for a small image size
*   Includes `git`, `nodejs`, and `npm`
*   Comes with `composer` pre-installed

## Installed PHP Extensions

*   `pdo_mysql`
*   `gd` (with freetype and jpeg support)

## `mcrypt` Extension

The `mcrypt` extension was removed as it is deprecated in PHP 7.1 and removed in PHP 7.2 and later. If your application relies on `mcrypt`, it is highly recommended to migrate to `openssl` for encryption.

## Default PHP Values

The default PHP values are inherited from the official `php:8.4-fpm-alpine` image. You can customize the PHP configuration by adding your own `.ini` files to the `conf.d` directory in your project.

For example, to increase the memory limit, you could create a file named `my.ini` with the following content:
```ini
memory_limit = 256M
```
And then copy it into the image:
```dockerfile
COPY my.ini /usr/local/etc/php/conf.d/
```