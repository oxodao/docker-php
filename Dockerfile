FROM php:8.0-cli-alpine

LABEL org.opencontainers.image.authors="Oxodao"

ENV COMPOSER_ALLOW_SUPERUSER 1

# Installing composer, symfony & other things
RUN set -ex \
  && apk --no-cache add postgresql-dev zip libzip-dev composer bash \
  && wget https://get.symfony.com/cli/installer -O - | bash \
  && mv /root/.symfony/bin/symfony /usr/local/bin/symfony \
  && apk --no-cache del bash

# Enabling the extensions for postgres & zip
RUN docker-php-ext-configure zip
RUN docker-php-ext-install pdo pdo_pgsql zip
