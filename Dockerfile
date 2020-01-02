FROM php:5.6-apache

MAINTAINER zsx <thinkernel@gmail.com>

ENV SSP_VERSION 1.3
ENV SSP_PACKAGE ltb-project-self-service-password

# Install the software that ssp environment requires
RUN apt-get update \
    && apt-get install -y libmcrypt-dev libldap2-dev --no-install-recommends \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install mcrypt ldap \
    && rm -rf /var/lib/apt/lists/*

# Install ssp
RUN curl -L https://ltb-project.org/archives/${SSP_PACKAGE}-${SSP_VERSION}.tar.gz \
    -o ssp.tar.gz && tar xf ssp.tar.gz -C /var/www/html && rm -f ssp.tar.gz \
    && mv /var/www/html/${SSP_PACKAGE}-${SSP_VERSION} /var/www/html/ssp

RUN chown -R www-data:www-data /var/www/html/ssp

EXPOSE 80
