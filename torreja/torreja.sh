#!/bin/bash
rm /etc/apache2/apache2.conf 
cp /apache2.conf /etc/apache2
/etc/init.d/apache2 start
a2enmod php7.0
TEST_VAR="\$_SERVER['SERVER_ADDR']"
PEPE="\$_SERVER['SERVER_PORT']"
mkdir /var/www/torreja.com
mkdir /var/www/torreja.com/public_html
echo "" >/etc/apache2/sites-available/000-default.conf
echo -e "<html>
<head>
<title>Prueba</title>
</head>
<body>
<h1>Torreja.com</h1>
<h2>IP del servidor que atiende la peticion: <?php echo $TEST_VAR;?></h2>
</body>
</html>">/var/www/torreja.com/public_html/index.php
echo -e "<html>
<head>
<title>Prueba</title>
</head>
<body>
<h1>Torreja.com/compras.html</h1>
<h2>ALternativa</h2>
</body>
</html>">/var/www/torreja.com/public_html/compras.html
echo -e "
<VirtualHost *:*>
        ServerAdmin jl14001@ues.edu.sv
        ServerName torreja.com
        ServerAlias www.torreja.com
        DocumentRoot /var/www/torreja.com/public_html
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>">/etc/apache2/sites-available/000-default.conf
/etc/init.d/apache2 restart
hostname -I
tcpdump


