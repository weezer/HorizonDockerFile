!/bin/bash


sed -i "/dashboard_url/c\dashboard_url=$VART" horizon.conf
sed -i "s/^username=.*/username=$USR/g" horizon.conf
sed -i "s/^password=.*/password=$PWD/g" horizon.conf
sed -i "s/^username='*admin_username=/admin_username=$ADUSR" horizon.conf
sed -i "s/^username='*admin_password=/admin_password=$ADPWD" horizon.conf
docker run -rm -t $os_release .
