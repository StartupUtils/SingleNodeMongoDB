snap install docker
apt  install docker-compose

echo "MONGO_PASSWORD=<password>" > .env

git clone https://github.com/StartupUtils/SingleNodeMongoDB.git

cd SingleNodeMongoDB

cp mongorun.service /etc/systemd/system/mongorun.service

docker-compose up
docker-compose build -d