FROM ubuntu:20.04
MAINTAINER qiyuan
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list \
	&& apt-get update --fix-missing && apt-get install -y vim apache2 --fix-missing \
	&& a2enmod proxy proxy_http proxy_balancer lbmethod_byrequests

