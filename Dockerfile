FROM php:8.2-apache

# Enable mod_rewrite for clean URLs
RUN a2enmod rewrite

# Install necessary system packages for PHP extensions
RUN apt-get update && apt-get install -y libicu-dev \
    && docker-php-ext-install intl

# Install required PHP extensions: pdo, pdo_mysql, mysqli
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Set working directory
WORKDIR /var/www/html

# Copy all files to container
COPY . .

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Set Apache's document root to public/
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# Expose Apache port
EXPOSE 80
