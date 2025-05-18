# Use official PHP image with Apache
FROM php:8.2-apache

# Enable Apache rewrite module (needed for CI4 routing)
RUN a2enmod rewrite

# Install PHP extensions required by CI4 (PDO and MySQL extensions)
RUN docker-php-ext-install pdo pdo_mysql

# Copy your project files into the container
COPY . /var/www/html/

# Set working directory inside container
WORKDIR /var/www/html/

# Set permissions for www-data user (Apache)
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Change Apache DocumentRoot to CI4's public folder
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# Expose port 80
EXPOSE 80
