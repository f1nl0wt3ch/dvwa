# STEP BY STEP TO SETUP DVWA IN DOCKER FOR PEN TESTING

## Description

- This project is created to help people to easily launch the DVWA application in Docker to improve their pentest skills.

## References
- [Install the LAMP Stack on CentOS 7](https://phoenixnap.com/kb/how-to-install-lamp-stack-on-centos)
- [Install MariaDB on CentOS 7](https://linuxize.com/post/install-mariadb-on-centos-7/)

## Date

- Created: Mon 11/4/2022
- Release: Tue 12/4/2022 

## Technologies

- Docker, CentOS, Apache, MariaDB, PHP, Web Application, Pentesting.

## Configuration

- **docker build -t dvwa:v1 -f Dockerfile .** build an image and give it a name as **dvwa** and version as **v1** from Dockerfile. If you don't want to cache the build, please add more argument like this **--no-cache=true**.
- **docker images** check if the image was created or not by listing all images locally.
- **docker run --name f1nl0wt3ch -p 1234:80 -t -i dvwa:v1** run a container from the image.
- **docker exec -it f1nl0wt3ch /bin/bash** enter the container.

## Screenshot

![dvwa.png](https://github.com/f1nl0wt3ch/dvwa/blob/main/dvwa.png)

## Troubleshooting
- **Failed to get D-Bus connection: Operation not permitted** replace /usr/bin/systemctl with [systemctl.py](https://github.com/gdraheim/docker-systemctl-replacement/blob/master/files/docker/systemctl.py) and run **RUN chmod a+x /usr/bin/systemctl** 
- **ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/lib/mysql/mysql.sock' (2)** server wasn't not yet started. Use **systemctl start mariadb** to start server.
- **Could not reliably determine the server's fully qualified domain name** 
```bash
sudo vim /etc/httpd/conf/httpd.conf
Insert the following line at the httpd.conf: ServerName localhost:80
```

## Author

- Thinh Dinh
- Software Developer at **OP Finance Group**

## Copyright

- © www.tikkidinh.com
