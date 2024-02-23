#!/bin/sh

while ! nc -z db 3306; do
    sleep 1
done

php artisan key:generate
php artisan migrate:fresh --seed

exec php-fpm