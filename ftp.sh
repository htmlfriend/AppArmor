apt install vsftpd

// directory - /usr/share/doc/vsftpd
// files - /var/lib/dpkg/info/vsftpd.conffiles
// access /etc/pam.d/vsftpd
// log /etc/logrotate.d/vsftpd

//share folder - /srv/ftp/
///secure ftp - /vsftpd.conf 
anonumous_enable=NO
local_enable=YES
anon_upload_enable=NO
anon_mkdir_write_enable=NO
// create user nologin - /etc/passwd 
// user has no default shell /usr/sbin/nologin
// for /etc/vsftpd.conf add userlist_enables=YES
// list users put to /etc/ftpusers

// or use chroot settings:
chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/etc/chroot_list_enable


mkdir /srv/ftp/uploads
chown ftp:ftp /srv/ftp/uploadschmod 775 /srv/ftp/uploads

chown_uploads=YES
chown_username=user
 


