FROM php:8.1-fpm

LABEL author="Allo hisse marre seul hein"
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    curl \
    netcat-openbsd \
    git \
    && docker-php-ext-install pdo pdo_mysql zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs npm
WORKDIR /var/www/html
EXPOSE 9000
COPY . /var/www/html
COPY init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init.sh
RUN composer install
RUN npm install && npm run build
ENTRYPOINT ["init.sh"]