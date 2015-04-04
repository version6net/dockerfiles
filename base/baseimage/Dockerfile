FROM phusion/baseimage

MAINTAINER Cougar <cougar@random.ee>

COPY id_rsa_docker-baseimage.pub /root/.ssh/authorized_keys

RUN rm -f /etc/service/sshd/down
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

EXPOSE 22
