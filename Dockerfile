# Use an official PHP runtime as a parent image
FROM php:8.1-fpm

# Set working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    libicu-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd intl zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy project files
COPY . .

# Install project dependencies
RUN composer install --no-interaction --no-scripts --no-progress --prefer-dist

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 8080
EXPOSE 8080

# Start PHP built-in server
CMD ["php", "spark", "serve", "--host=0.0.0.0", "--port=8080"]