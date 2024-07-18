FROM php:8.3.9-apache

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    && apt-get install -y libicu-dev \
    && docker-php-ext-install intl pdo pdo_mysql


ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/composer

# Install dependencies
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    curl

# silent, show errors
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php

# Step 3: Run the installer
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
# Step 5: Clean up
RUN rm /tmp/composer-setup.php
# Verify Composer installation
RUN composer --version

# Verify Composer installation
RUN composer --version

RUN a2enmod rewrite