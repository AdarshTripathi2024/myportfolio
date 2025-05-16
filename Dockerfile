FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libonig-dev \
    libzip-dev \
    unzip \
    zip \
    && docker-php-ext-install \
    mysqli \
    pdo \
    pdo_mysql \
    mbstring

RUN a2enmod rewrite

WORKDIR /var/www/html

COPY . .

RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/public|' /etc/apache2/sites-available/000-default.conf

RUN chown -R www-data:www-data /var/www/html/writable \
    && chmod -R 775 /var/www/html/writable

# Final Fix for PORT issue here:
CMD sh -c "php -S 0.0.0.0:$PORT -t public"
