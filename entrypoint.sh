#!/bin/bash
set -e

echo "=== Starting Container ==="

echo "Starting PHP-FPM..."
php-fpm -D

echo "Waiting for PHP-FPM to start..."
sleep 3

# ✅ RUN DATABASE MIGRATIONS AUTOMATICALLY
echo "Running database migrations..."
php bin/console doctrine:migrations:migrate --no-interaction

echo "Starting Nginx..."
nginx -g "daemon off;"