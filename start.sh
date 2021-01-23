#!/bin/bash

if [ ! -f /mumble/mumble-server.ini ]
then
 sed -i 's/var.log.mumble-server/mumble/' /etc/mumble-server.ini
 sed -i 's/var.lib.mumble-server/mumble/' /etc/mumble-server.ini
 cp /etc/mumble-server.ini /mumble/mumble-server.ini
 chmod 777 /mumble/mumble-server.ini
 echo The config file is created in /mumble
fi

if [ ! -f /botamusique/config/config.ini ]
then
 cp /botamusique/configuration.default.ini /botamusique/config/config.ini
 echo MusicBot config file created
fi 

echo Starting mumble server
chmod -R 777 /mumble
sed -i 's/^INIFILE=.*/INIFILE=\/mumble\/mumble-server.ini/' /etc/init.d/mumble-server
service mumble-server start
echo mumble is started
chmod -R 777 /botamusique
sed -i 's/configuration.default.ini/config\/config.ini/' /botamusique/mumbleBot.py
cd /botamusique && nohup python mumbleBot.py &
echo music bot is created.

while true
do 
sleep 3000
done

