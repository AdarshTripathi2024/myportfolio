FROM php:8.2-apache

# Enable mod_rewrite
RUN a2enmod rewrite

# Install dependencies
RUN apt-get update && apt-get install -y libicu-dev libzip-dev unzip zip git \
    && docker-php-ext-install intl pdo pdo_mysql

# Set working directory
WORKDIR /var/www/html

# Copy everything
COPY . .

# Copy env
COPY .env /var/www/html/.env

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Set Apache root to /public
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

EXPOSE 80
