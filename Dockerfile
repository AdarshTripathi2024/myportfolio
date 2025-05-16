FROM php:8.2-apache

# Install necessary libraries
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

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy all project files
COPY . .

# Change Apache root directory to /public (required by CI4)
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/public|' /etc/apache2/sites-available/000-default.conf

# Permissions for writable folder
RUN chown -R www-data:www-data writable \
    && chmod -R 775 writable

# ❗ Final Fix: Use shell to expand $PORT variable
CMD sh -c "php -S 0.0.0.0:$PORT -t public"
