#!/bin/sh

mkdir -p /opt/murmur

./build.sh

docker run -i -t -d --name mumble --restart always --network host -v /opt/murmur:/mumble -v /opt/murmur:/bot/config zimonzk/mumbledocker
