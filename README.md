# Single Node MongoDB Instance

### Deploy a single instance of MongoDB on [Vultr](https://my.vultr.com/)

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZONviYpvlwUX9mo0d1X1aH9k0IUAVTF-DRzZ4qQLleZI9l6qLVOOF9SfskTzN8JnA0g&usqp=CAU" alt="drawing" width="200"/> <img src="https://webassets.mongodb.com/_com_assets/cms/mongodb_logo1-76twgcu2dm.png" alt="drawing" width="200"/>

### Deployment Instructions
#### Go to Vultr and Create a new Startup Script with the code below.
This script will install docker and docker-compose, clone the Mongo Files, set the Mongo Password, and set up reboot logic so Mongo starts up when the node is restarted. 

**NOTE: Make sure you replace <ADD PASSWORDD HERE> with your Mongo password
```
#!/bin/sh

snap install docker -y
apt install docker-compose -y

git clone https://github.com/StartupUtils/SingleNodeMongoDB.git

cp -r /tmp/SingleNodeMongoDB /home/
echo "MONGO_PASSWORD=<ADD PASSWORDD HERE>" > /home/SingleNodeMongoDB/.env
cp /home/SingleNodeMongoDB/mongorun.service /etc/systemd/system/mongorun.service

systemctl daemon-reload
systemctl enable mongorun.service
systemctl start mongorun.service
```

#### Create an Ubuntu 18.04 Instance
Make sure you select the startup script script you created
  
### Check if Mongo is Running after startup
Sometimes the startup script is not run the first time the server boots up.

SSH into the instance and run the following command.
```
docker ps
```
You should see something like this:
```
CONTAINER ID   IMAGE                         COMMAND                  CREATED        STATUS        PORTS                                           NAMES
b61d8f755667   bitnami/mongodb-sharded:4.4   "/opt/bitnami/script…"   12 hours ago   Up 12 hours   27017/tcp                                       singlenodemongodb_mongodb-shard0_1
570ce0ae0eca   bitnami/mongodb-sharded:4.4   "/opt/bitnami/script…"   12 hours ago   Up 12 hours   27017/tcp                                       singlenodemongodb_mongodb-cfg_1
81590c82a113   bitnami/mongodb-sharded:4.4   "/opt/bitnami/script…"   12 hours ago   Up 12 hours   0.0.0.0:27017->27017/tcp, :::27017->27017/tcp   singlenodemongodb_mongodb-sharded_1

```
If you don't see Containers running, run the following:
```
bash /tmp/firstboot.exec  
```
then run check if Mongo is running again:
```
docker ps 
```
  
**Note: Once Mongo is running, restart your server to make sure docker starts up when your server is restarted
