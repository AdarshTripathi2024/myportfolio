# Use PHP 8.2 with Apache
FROM php:8.2-apache

# Install PHP extensions required by CodeIgniter
RUN docker-php-ext-install mysqli pdo pdo_mysql mbstring

# Enable Apache mod_rewrite for CI4 routing
RUN a2enmod rewrite

# Copy the project to the Apache web directory
COPY . /var/www/html/

# Set the working directory to CI4's public folder
WORKDIR /var/www/html/public

# Fix permissions
RUN chown -R www-data:www-data /var/www/html/writable \
    && chmod -R 775 /var/www/html/writable

# Set the correct Apache DocumentRoot
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/public|' /etc/apache2/sites-available/000-default.conf

# Expose port 80
EXPOSE 80

CMD ["apache2-foreground"]
