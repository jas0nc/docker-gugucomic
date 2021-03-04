FROM php:7.4-apache
LABEL maintainer="jas0nc"

# Download script to install PHP extensions and dependencies
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
      zip \
    && install-php-extensions \
      gd \
      zip

#copy website files to image
COPY gugucomic-cartoonmad/ /var/www/html
RUN chmod +x -R /var/www/html
ADD sample-config/ /var/www/html/config
ADD sample-CBZ/ /var/www/html/CBZ
VOLUME ['/var/www/html/config']
VOLUME ['/var/www/html/CBZ']

EXPOSE 80