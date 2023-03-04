FROM php:8.2.3-fpm

ARG user
ARG uid

WORKDIR /var/www/html

RUN apt-get update --fix-missing && apt-get install -y \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zlib1g-dev \
    zip \
    unzip \
    sqlite3

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd
RUN docker-php-ext-install zip

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

RUN /usr/sbin/useradd -G www-data,root -u $uid -d /home/$user $user

RUN mkdir /home/$user
RUN chown $user:$user /home/$user

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY ./docker-files/php/php.ini /usr/local/etc/php/conf.d/99-custom.ini

USER $user
