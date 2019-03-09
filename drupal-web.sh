#/bin/bash
yum update -y 
yum install lvm2* -y 
yum install nfs-utils* php* http* -y 
yum install wget -y
yum install unzip* -y
systemctl start nfs
systemctl start httpd
echo "This is drupal-web server" >>/var/www/html
fdisk /dev/sdh
mkfs.ext4 /dev/sdh
mkdir /nfs-drupal
mount /dev/sdh /nfs-drupal
echo "/dev/sdh  /nfs-drupal ext4 defaults 0 0" >> /etc/fstab
mount -a
cd /tmp
wget https://ftp.drupal.org/files/projects/drupal-7.56.zip
unzip drupal-7.56.zip
cp -R . /nfs-drupal/
systemctl restart httpd
echo "/nfs-drupal *(rw,sync,no_root_sqash)|sudo tee --append /etc/exportfs
exportfs -a
systemctl restart nfs
setenforce 0 
