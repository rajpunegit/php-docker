FROM php:7.3-apache
COPY src/ /var/www/html
COPY ports.conf /etc/apache2/
COPY docker-entrypoint.sh /
RUN apt update && apt install  openssh-server sudo -y 
RUN apt-get install vim sudo -y
RUN useradd -rm -d /home/admin -s /bin/bash -g root -G sudo -u 1000 admin 
RUN  echo 'admin:admin123' | chpasswd
RUN service ssh start
RUN docker-php-ext-install mysqli pdo pdo_mysql
CMD ["/usr/sbin/sshd","-D"]
EXPOSE 81
EXPOSE 22
EXPOSE 3308
