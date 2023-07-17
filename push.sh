#!/bin/bash
rsync -avz --chown=www-data:www-data --rsync-path="sudo rsync" html templates cgi images js css robots.txt sitemap.xml vps:/var/www/html/esp8266code
