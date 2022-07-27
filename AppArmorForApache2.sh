// Apache and AppArmor

apt policy Apparmor
Apparmor_status
apt install apparmor-utils libapache2-mod-apparmor
// will create a file /etc/apparmor.d/usr.sbin.apache2
systemctl stop apache2
a2dismod mpm_event
// disabled module mpm_event
a2enmod mpm_prefork
// enabled module mpm_prefork
a2enmod apparmor
// enabled module apparmor
systemctl restart apache2
aa-enforce /etc/apparmor.d/usr.sbin.apache2
// enforced mode 
Apparmor_status