FROM ubuntu:20.04
MAINTAINER qiyuan
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list \
	&& apt-get update --fix-missing && apt-get install -y vim apache2 --fix-missing \
	&& a2enmod proxy proxy_http proxy_balancer lbmethod_byrequests
COPY apache2/start.sh /usr/local/apache2/start.sh
RUN chmod 777 /usr/local/apache2/start.sh
EXPOSE 80
CMD ["/bin/sh", "/usr/local/apache2/start.sh"]

