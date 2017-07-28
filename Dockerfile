FROM php:7.0-fpm-alpine
# php:7.0-alpine source code:
# https://github.com/docker-library/php/tree/ddc7084c8a78ea12f0cfdceff7d03c5a530b787e/7.0/fpm/alpine

# See "Best practices for writing Dockerfiles":
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices

# Commands for adding PHP extensions are adapted from StackOverflow answer:
# see http://stackoverflow.com/a/39218681

##
# To install Xdebug
# See https://github.com/prooph/docker-files/blob/master/php/7.0-cli-xdebug
##
ENV BUILD_DEPS \
  autoconf \
  cmake \
  file \
  g++ \
  git \
  gcc \
  icu-dev \
  libc-dev \
  libmcrypt-dev \
  libpng-dev \
  libxslt-dev \
  make \
  pkgconf \
  re2c

# These libraries are persistent
ENV RUNTIME_DEPS \
  icu \
  libmcrypt \
  libpng \
  libxslt \
  openssh \
  openssl \
  tini

ENV PHP_EXTENSIONS \
  gd \
  intl \
  mcrypt \
  mysqli \
  pdo_mysql \
  xsl \
  zip

RUN set -x \
  && apk update && apk add $RUNTIME_DEPS $BUILD_DEPS \
  && docker-php-ext-install $PHP_EXTENSIONS \
  && rm /var/cache/apk/* \
  && apk del $BUILD_DEPS

COPY config/magento.conf /usr/local/etc/php-fpm.d/zzz-magento.conf

VOLUME ["/var/www"]