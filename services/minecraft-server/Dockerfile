FROM v6net/openjdk-7

MAINTAINER Cougar <cougar@random.ee>

RUN useradd -M -s /bin/false --uid 1000 minecraft
RUN mkdir /minecraft-server
RUN chown minecraft:minecraft /minecraft-server

EXPOSE 25565

COPY service.sh /etc/service/minecraft-server/run
COPY setup.sh /etc/my_init.d/50_setup_minecraft-server

VOLUME ["/minecraft-server"]
COPY server.properties /tmp/server.properties
WORKDIR /minecraft-server

ENV UID=1000
ENV MOTD A Minecraft Server Powered by Docker
ENV JVM_OPTS -Xmx1024M -Xms1024M
ENV TYPE=VANILLA VERSION=1.10.2 LEVEL=world PVP=true
