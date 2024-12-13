#!/bin/bash

# Set Apache to listen on the port specified by PORT (or default to 80)
sed -i "s/Listen 80/Listen ${PORT:-80}/g" /etc/apache2/ports.conf

# Update the VirtualHost to use the correct port
sed -i "s/:80>/:${PORT:-80}>/g" /etc/apache2/sites-available/000-default.conf

# Start Apache in the foreground
apache2-foreground