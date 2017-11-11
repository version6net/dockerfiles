FROM v6net/baseimage

MAINTAINER Cougar <cougar@random.ee>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-9-jre-headless wget && apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-9-openjdk-amd64
