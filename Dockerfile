# Use official PHP image with Apache
FROM php:8.2-apache

# Install required packages and PHP extensions
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

# Enable Apache rewrite module for CI4 routing
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy all files to container
COPY . .

# Set correct Apache DocumentRoot to /public
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/public|' /etc/apache2/sites-available/000-default.conf

# Fix folder permissions for writable/
RUN chown -R www-data:www-data /var/www/html/writable \
    && chmod -R 775 /var/www/html/writable

# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
