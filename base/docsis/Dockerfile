FROM centos:5

MAINTAINER cougar@random.ee

RUN yum -y install curl which libtool glib2-devel gcc flex bison net-snmp-devel make openssl-devel

RUN curl --location --silent https://github.com/rlaager/docsis/archive/master.tar.gz | tar xzvfp -
RUN cd docsis-master && ./autogen.sh && make && make install
