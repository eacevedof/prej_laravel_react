FROM php:8.3.9-apache

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    && apt-get install -y libicu-dev \
    && docker-php-ext-install intl pdo pdo_mysql

RUN a2enmod rewrite