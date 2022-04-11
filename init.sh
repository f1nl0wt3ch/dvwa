docker pull centos:7
docker run -it --name dvwa-web centos:7
mkdir -p /var/www && cd /var/www
git clone https://github.com/digininja/DVWA.git
mv DVWA dvwa
chown -R apache:apache /var/www/html
yum update -y
yum -y install epel-release
yum install git httpd mariadb-server php php-mysqli php-gd -y
git --version
httpd -v
rpm -qa | grep mariadb
php --version
docker cp ./config/dvwa.conf /etc/httpd/sites-available/
docker cp ./config/httpd.conf /etc/httpd/conf/
docker cp ./config/config.inc.php /var/www/dvwa/config
docker commit dvwa-web dvwa-web:v1
