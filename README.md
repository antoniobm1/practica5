# practica5
La url de la practica 5 es la siguiente:
      https://github.com/antoniobm1/practica5.git
      
#Instalacion Apache como Balanceador

Instalaremos Apache con sus respectivos paquetes y activaremos los modulos para que pueda hacer de balanceador

```
apt-get install apache2 -y

apt-get install php libapache2-mod-php php-mysql -y


sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_ajp
sudo a2enmod rewrite
sudo a2enmod deflate
sudo a2enmod headers
sudo a2enmod proxy_balancer
sudo a2enmod proxy_connect
sudo a2enmod proxy_html
sudo a2enmod lbmethod_byrequests

```

#Configuracion del balanceador
#Editamos el archivo 000-default.conf que está en el directorio /etc/apache2/sites-enabled , en el cual pondremos las ips de los 2 frontales, asi balanceara entre 1 frontal y otro.
```
<VirtualHost *:80>
    # Dejamos la configuración del VirtualHost como estaba
    # sólo hay que añadir las siguiente directivas: Proxy y ProxyPass

    <Proxy balancer://mycluster>
        # Server 1
        BalancerMember http://IP-HTTP-SERVER-1

        # Server 2
        BalancerMember http://IP-HTTP-SERVER-2
    </Proxy>

    ProxyPass / balancer://mycluster/
</VirtualHost>
```


#Reiniciamos el servidor apache
systemctl restart apache2


