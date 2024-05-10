FROM php:8.0.0-fpm-alpine
#8.2-fpm-alpine

WORKDIR /var/www/html

# Update app
RUN apk update && apk add --no-cache tzdata

RUN apk add --no-cache wkhtmltopdf ttf-dejavu
#RUN cp /usr/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf
RUN ln -s /usr/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf
RUN ln -s /usr/bin/wkhtmltoimage /usr/local/bin/wkhtmltoimage
#RUN cp /usr/bin/wkhtmltoimage /usr/local/bin/wkhtmltoimage
COPY src .
# Instalando extensões necessárias do PHP
RUN apk add --no-cache mysql-client msmtp perl wget procps shadow libzip libpng libjpeg-turbo libwebp freetype icu

#RUN apk add --no-cache wkhtmltopdf


#RUN curl "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-3/wkhtmltox-0.12.6-3.archlinux-x86_64.pkg.tar.xz" -L -o "wkhtmltopdf.tar.xz"
#RUN tar Jxvf wkhtmltopdf.tar.xz


# Set timezone
ENV TZ="Europe/Madrid"

RUN apk add --update --no-cache autoconf g++ make openssl-dev
RUN apk add libpng-dev
RUN apk add libzip-dev
RUN apk add --update linux-headers

#aumentar memoria (ángela)
#RUN echo 'memory_limit = 1G' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini;
#ENV PHP_MEMORY_LIMIT=1G

#install xdebug
RUN pecl install xdebug
COPY 90-xdebug.ini "${PHP_INI_DIR}"/conf.d/

RUN apk add --no-cache --virtual build-essentials \
    icu-dev icu-libs zlib-dev g++ make automake autoconf libzip-dev \
    libpng-dev libwebp-dev libjpeg-turbo-dev freetype-dev && \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-install gd && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install intl && \
    docker-php-ext-install bcmath && \
    docker-php-ext-install opcache && \    
    docker-php-ext-install exif && \
    docker-php-ext-install zip && \
    apk del build-essentials && rm -rf /usr/src/php*

RUN apk add --no-cache pcre-dev $PHPIZE_DEPS \
        && pecl install redis \
        && docker-php-ext-enable redis.so

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN chown -R laravel /var/www/html/
#RUN chown laravel /usr/local/bin/wkhtmltopdf
#RUN chown laravel /usr/local/bin/wkhtmltoimage


USER laravel
