#!/bin/sh

set -e

cd /minecraft-server
exec setuser minecraft java $JVM_OPTS -jar minecraft_server.jar
