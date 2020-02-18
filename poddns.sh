export myIP=$(ip route get 1 | awk '{print $NF;exit}')
echo $myIP
chmod 777 /data
chmod 777 /data/*
while true; do sleep 10000; done
