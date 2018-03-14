FROM php:5.6-apache

MAINTAINER mengzhaopeng <qiuranke@gmail.com>

ENV SSP_PACKAGE ltb-project-self-service-password-1.0.tar.gz

# Install the software that ssp environment requires
RUN apt-get update \
    && apt-get install -y libmcrypt-dev libldap2-dev --no-install-recommends \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install mcrypt ldap \
    && rm -rf /var/lib/apt/lists/*

# Install ssp
RUN curl -L https://ltb-project.org/archives/${SSP_PACKAGE} \
    -o ssp.tar.gz && tar xf ssp.tar.gz -C /var/www/html && rm -f ssp.tar.gz \
    && mv /var/www/html/ltb-project-self-service-password-1.0 /var/www/html/ssp

# ldap server info
ENV LDAP_URL "ldap://ldap:389"
ENV LDAP_BINDDN "cn=admin,dc=example,dc=com"
ENV LDAP_BINDPW "changeme"
ENV LDAP_BASE "dc=example,dc=com"

# ltb configuration file info
ENV PWD_MIN_LENGTH 0
ENV PWD_MAX_LENGTH 0
ENV PWD_MIN_LOWER 0
ENV PWD_MIN_UPPER 0
ENV PWD_MIN_DIGIT 0
ENV PWD_MIN_SPECIAL 0
ENV PWD_SPECIAL_CHARS "^a-zA-Z0-9"
ENV MAIL_FROM "admin@example.com"
ENV NOTIFY_ON_CHANGE false
ENV SMTP_AUTH true
ENV SMTP_HOST localhost
ENV SMTP_USER smtpuser
ENV SMTP_PASS smtppass

# This is where configuration goes
ADD assets/config.inc.php /var/www/html/ssp/conf/config.inc.php

ADD assets/apache2.sh /etc/service/apache2/run

EXPOSE 80

CMD ["/etc/service/apache2/run"]
