# STEP BY STEP TO SETUP DVWA IN DOCKER FOR PEN TESTING

## Description

- This project is created to help people to easily launch the DVWA application in Docker to improve their pentest skills.

## Date

- Created: Mon 11/4/2022
- Release: Tue 12/4/2022 

## Technologies

- Docker, CentOS, Apache, MariaDB, PHP, Web Application, Pentesting.

## Configuration

- **docker build -t dvwa:v1 -f Dockerfile .** build an image and give it a name as **dvwa** and version as **v1** from Dockerfile
- **docker images** check if the image was created or not by listing all images locally.
- **docker run --rm --name f1nl0wt3ch -p 1234:80 -t -i dvwa:v1 /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf** start a container from the image.

## Author

- Thinh Dinh
- Software Developer at **OP Finance Group**

## Copyright

- © www.tikkidinh.com
