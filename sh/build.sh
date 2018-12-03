#!/bin/bash

echo "Build de php-fpm 5"
docker build -t gerault/php5-fpm . --pull
