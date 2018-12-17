FROM php:5-fpm 
MAINTAINER Mathieu GERAULT <mathieu.gerault@gmail.com>
LABEL Description="PHP5 from Mathieu GERAULT"

# Some dependencies
RUN apt-get update && apt-get upgrade -y \ 
		wget \
		unzip \
		git \
		libfreetype6-dev \ 	
		libjpeg62-turbo-dev \ 
		libpq-dev \ 
		libmagickwand-dev \ 
		libmcrypt-dev \ 
		libpng-dev \
#		libpng12-dev \ 
		libmemcached-dev \ 
		libssl-dev \ 
		libssl-doc \ 
		libsasl2-dev \ 
		zlib1g-dev \ 
	&& docker-php-ext-install \ 
		bz2 \ 
		iconv \ 
		mbstring \ 
		mcrypt \
		mysql \ 
		mysqli \ 
		pgsql \ 
		pdo_mysql \ 
		pdo_pgsql \ 
		soap \ 
		zip \ 
	&& docker-php-ext-configure gd \ 
		--with-freetype-dir=/usr/include/ \ 
		--with-jpeg-dir=/usr/include/ \ 
		--with-png-dir=/usr/include/ \ 
	&& docker-php-ext-install gd \ 
#	&& pecl install xdebug && docker-php-ext-enable xdebug \ 	#pecm xdebug doesn't work anymore with php5
	&& pecl install mongodb && docker-php-ext-enable mongodb \ 
	&& pecl install redis && docker-php-ext-enable redis \ 
	&& yes '' | pecl install imagick && docker-php-ext-enable imagick

# Locales
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR.UTF-8
ENV LC_ALL fr_FR.UTF-8

RUN apt-get install -y locales locales-all && update-locale LANG=$LANG

# Timezone
RUN ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime && dpkg-reconfigure -f noninteractive tzdata


