FROM php:8.2-cli

# Install necessary PHP extensions and libraries
RUN apt-get update && apt-get install -y \
    unzip \
    libzip-dev \
    libonig-dev \
    libpq-dev \
    zip \
    curl \
    git \
    && docker-php-ext-install mbstring pdo pdo_mysql mysqli

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Set permissions for writable directory (if needed by CodeIgniter 4)
RUN chown -R www-data:www-data writable \
    && chmod -R 775 writable

# FINAL FIX:
# Use a shell so that $PORT environment variable is correctly interpreted
CMD sh -c "php -S 0.0.0.0:\$PORT -t public"
