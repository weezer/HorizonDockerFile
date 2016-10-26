#!/bin/sh
cd /opt/HorizonDockerFile
sudo docker build -t $os_release --build-arg os_release=$os_release .
sudo sed -i "/dashboard_url/c\dashboard_url=$IP_ADDRESS" horizon.conf
sudo sed -i "s/^username=.*/username=$DEMO_USR/g" horizon.conf
sudo sed -i "s/^password=.*/password=$DEMO_PWD/g" horizon.conf
sudo sed -i "s/^admin_username=.*/admin_username=$ADMIN_USR/g" horizon.conf
sudo sed -i "s/^admin_password=.*/admin_password=$ADMIN_PWD/g" horizon.conf
sudo cat horizon.conf
sudo docker run -t $os_release
sudo docker rm $(sudo docker ps -a -q)
