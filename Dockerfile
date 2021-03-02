FROM php:7.4-apache
LABEL maintainer="jas0nc"

# Download script to install PHP extensions and dependencies
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
      curl \
      git \
      zip unzip \
    && install-php-extensions \
      bz2 \
      gd \
      zip

#copy website files to image
COPY cartoonmad/ /var/www/html
VOLUME sample-config /var/www/html/config
VOLUME sample-CBZ /var/www/html/CBZ

EXPOSE 80