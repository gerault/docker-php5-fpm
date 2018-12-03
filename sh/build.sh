#!/bin/bash

echo "Build de php-fpm 5"
docker build -t gerault/docker-php5-fpm . --pull
