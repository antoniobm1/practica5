#!/bin/bash
#Este script lo ejecutaremos en la maquina que actuara como apache-server para ello instalaremos el apache y sus paquetes ademas de clonar la practica y configurar el acceso a la base de datos de la otra maqui$
#Actualizamos los repositorios
apt-get update

#instalamos apache
apt-get install apache2 -y

#Instalamos paquetes para apache
apt-get install php libapache2-mod-php php-mysql -y

#instalar git y clonar la practica del profesor en /var/www/html y cambiar sus permisos a escritura
apt-get install git -y
cd /var/www/html
rm -r iaw-practica-lamp/
git clone https://github.com/josejuansanchez/iaw-practica-lamp.git
chown www-data:www-data * -R

#Usamos la aplicacion sed la cual nos permite modificar en un archivo las palabras que deseemos por otras
sudo sed -i "s/localhost/3.87.52.148/" /var/www/html/iaw-practica-lamp/src/config.php
