sudo apt install apache2
sudo ufw allow "Apache Full"
// mod_sll with appArmor
sudo a2enmod ssl
sudo sytstemctl restart apache2

// sertificate - selfsigned 
sudo openssl req -x509 -nodes -day 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt

// configurate /etc/apache2/site-available/example.conf
<VirtualHost *:443>
    ServerName example.com // 192.168.1.11
    DocumentRoot /var/www/example.com // or IP

    SSLEngine on 
    SSLCertificateFile /etc/ssl/certs/apache-selfsigned.crt 
    SSLCertificateKeyFile /etc/ssl/private/apache-selfsigned.key
</VirtualHost>    

//enable a2ensite
sudo a2ensite example.conf
sudo apache2ctl configtest

// redirect http to https
<VirtualHost *:80>
    ServerName example.com or IP
    Redirect / https://exaple.com or IP/
</VirtualHost>

sudo apache2ctl configtest
sudo systemctl reload apache2    
