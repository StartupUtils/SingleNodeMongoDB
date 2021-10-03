# SingleNodeMongoDB

### Deploy a single instance of MongoDB on [Vultr](https://my.vultr.com/)

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZONviYpvlwUX9mo0d1X1aH9k0IUAVTF-DRzZ4qQLleZI9l6qLVOOF9SfskTzN8JnA0g&usqp=CAU" alt="drawing" width="200"/> <img src="https://webassets.mongodb.com/_com_assets/cms/mongodb_logo1-76twgcu2dm.png" alt="drawing" width="200"/>

### Deployment Instructions
#### Go to Vultr and Create a new Startup Script with the code below.
This script will install docker and docker-compose, clone the Mongo Files, set the Mongo Password, and set up reboot logic so Mongo starts up when the node is restarted. 
NOTE: Make sure you replace <ADD PASSWORDD HERE> with your Mongo password
``
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
``
