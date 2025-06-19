# 1. Use official PHP + Apache
FROM php:8.1-apache

# 2. Install MySQL PDO driver
RUN docker-php-ext-install pdo_mysql

# 3. Enable URL rewrites (for .htaccess)
RUN a2enmod rewrite

# 4. Copy your app code into Apache’s webroot
COPY . /var/www/html/

# 5. Fix permissions (if you write/upload files)
RUN chown -R www-data:www-data /var/www/html \
 && chmod -R 755 /var/www/html

# 6. Expose the HTTP port
EXPOSE 80

# 7. Start Apache in the foreground
CMD ["apache2-foreground"]
