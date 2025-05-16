FROM php:8.2-cli

RUN apt-get update && apt-get install -y \
    unzip \
    libzip-dev \
    libonig-dev \
    libpq-dev \
    zip \
    curl \
    git \
    && docker-php-ext-install mbstring pdo pdo_mysql mysqli

WORKDIR /app

COPY . .

RUN chown -R www-data:www-data writable \
    && chmod -R 775 writable

ENV PORT=8080

# ✅ Correct launch for Railway + CI4
CMD ["sh", "-c", "php -S 0.0.0.0:$PORT -t public"]
