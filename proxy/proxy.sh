#!/bin/bash
rm /etc/apache2/apache2.conf 
cp /apache2.conf /etc/apache2
/etc/init.d/apache2 start
a2enmod proxy_html 
a2enmod proxy 
a2enmod proxy_connect 
a2enmod proxy_http 
/etc/init.d/apache2 restart
echo "" >/etc/apache2/sites-available/000-default.conf
echo -e "
<VirtualHost *:80>
    ServerAdmin jl14001@ues.edu.sv
    ServerName www.torreja.com
    ProxyPass / http://torreja:80
    ProxyPassReverse / http://torreja:80
</VirtualHost>">/etc/apache2/sites-available/000-default.conf
/etc/init.d/apache2 restart
hostname -I
tcpdump


