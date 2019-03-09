#/bin/bash
yum update -y 
yum install lvm2* -y 
yum install nfs* php* http* -y 
yum install mariadb* -y
systemctl start nfs
systemctl start httpd
systemctl start mariadb 
echo "This is drupal-web server" >>/var/www/html
systemctl restart httpd
setenforce 0 
