FROM centos:7
RUN mkdir -p /var/www/html /etc/httpd/sites-available
RUN chmod -R 755 /var/www
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install git
RUN cd /var/www && git clone https://github.com/digininja/DVWA.git
RUN mv /var/www/DVWA /var/www/dvwa
RUN yum -y install supervisor 
RUN yum -y install httpd 
RUN yum -y install mariadb-server 
RUN yum -y install php
RUN yum -y install php-mysqli 
RUN yum -y install php-gd
COPY ./config/dvwa.conf /etc/httpd/sites-available/
COPY ./config/httpd.conf /etc/httpd/conf/
COPY ./config/config.inc.php /var/www/dvwa/config/
COPY ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +w /var/www/dvwa/hackable/uploads/
RUN chmod +w /var/www/dvwa/external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
WORKDIR /var/www/html
EXPOSE 80
CMD ["/usr/bin/supervisord"]