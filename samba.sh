// Sever Message Block
// Common internet file system
// demon /usr/sbin/smbd -samba
// demon /usr/sbin/nmbd - netbios
// smbclient, winbind
apt install samba smbclient 
apt-get install winbind
// file samba - /etc/logrotate.d/samba /etc/samba
// service smb and service nmb 
systemctl status smbd 
systemctl status nmbd
cat /lib/systemd/system/smbd.service
cat /lib/systemd/system/nmbd.service

smbclient -L localhost
nmblookup -S '*'\
smbtree
smbpasswd -user1
smbclient -L localhost -U user1
// password - /var/lib/samba/private/passdb.tdb
