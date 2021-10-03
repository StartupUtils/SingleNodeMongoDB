#!/bin/sh

snap install docker -y
apt install docker-compose -y

git clone https://github.com/StartupUtils/SingleNodeMongoDB.git

cp -r /tmp/SingleNodeMongoDB /home/
echo "MONGO_PASSWORD=rootpassword" > /home/SingleNodeMongoDB/.env
cp /home/SingleNodeMongoDB/mongorun.service /etc/systemd/system/mongorun.service

systemctl daemon-reload
systemctl enable mongorun.service
systemctl start mongorun.service