# Use PHP 8.2 with Apache
FROM php:8.2-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip \
    libicu-dev \
    # Add MySQL client
    default-mysql-client

# Install PHP extensions
RUN docker-php-ext-configure intl
RUN docker-php-ext-install \
    pdo \
    pdo_mysql \
    mysqli \
    mbstring \
    exif \
    pcntl \
    bcmath \
    gd \
    zip \
    intl

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Create a non-root user
RUN useradd -m myuser
RUN chown -R myuser:myuser /var/www/html

# Switch to non-root user
USER myuser

# Copy only necessary files for dependency installation first
COPY --chown=myuser:myuser composer.json composer.lock* ./

# Install project dependencies
RUN composer install \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --ignore-platform-req=ext-intl

# Switch back to root to set up Apache
USER root

# Copy the rest of the application
COPY --chown=myuser:myuser . .

# Configure Apache
RUN a2enmod rewrite

# Fix permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]