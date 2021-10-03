snap install docker -y
apt install docker-compose -y

git clone https://github.com/StartupUtils/SingleNodeMongoDB.git

cp -r /tmp/SingleNodeMongoDB /home
echo "export MONGO_PASSWORD=rootpassword" > /home/SingleNodeMongoDB/.env
cp /home/SingleNodeMongoDB/mongorun.service /etc/systemd/system/mongorun.service