#!/bin/sh

while ! nc -z db 3306; do
    sleep 1
done

php artisan key:generate

exec php-fpm