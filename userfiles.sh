// edit the file httpd.conf
<IfModule mod_uerdir.c>
    UserDir public_html
    UserDir disabled root
    <Directory /home/*/public_html>
        AllowOverride AllowOverride
        Options MultiViews Indexes
        SymLinksIfOwnerMatch
        <Limit GET POST OPTIONS>
            Require all granted
        </Limit>
        <LimitExcept GET POST OPTIONS>
            Require all denied
        </LimitExcept>
    </Directory>
</IfModule>        


// Users use :
mkdir $HOME/public_html
chmod +x /home /home/*

// enable the usermod module:
a2enmod userdir 
// activate 
systemctl restart apache2
// http://hostname/userdir


// use mod_ssl

a2enmod mod_ssl
// create self-signed certificate
apt install openssl
openssl genrsa -des3 -out server.key 2048
openssl openssl rsa -in server.key -out server.key.insecure
mv server.key server.key.secure
mv server.key.insecure server.key
openssl req -new -key server.key -out server.csr
openssl x509 -req -days 365 -i server.csr -signkey server.key -out server.crt 
cp server.crt /etc/ssl/certs
cp server.key /etc/ssl/private 
// edit /default-ssl.conf
sslcertificatefile /etc/ssl/certs/server.crt
sslcertificatekeyfile /etc/ssl/private/server.key
systemctl reload apache2.service

// another way to generate ssl
apt-get install software -properties-common
add-apt-repository universe
add-apt-repository ppa:certbot/certbot
apt-get update
apt-get install certbot python3-certbot-apache
certbot certonly --apache 
