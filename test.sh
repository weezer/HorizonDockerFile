#!/bin/sh

docker build -t $os_release --build-arg os_release=$os_release .
sed -i "/dashboard_url/c\dashboard_url=$VART" horizon.conf
sed -i "s/^username=.*/username=$VUSR/g" horizon.conf
sed -i "s/^password=.*/password=$VPWD/g" horizon.conf
sed -i "s/^admin_username=.*/admin_username=$ADUSR/g" horizon.conf
sed -i "s/^admin_password=.*/admin_password=$ADPWD/g" horizon.conf
echo $os_release
docker run -t $os_release
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
