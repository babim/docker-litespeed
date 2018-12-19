# docker-litespeed
litespeed web server on docker
# Usage
```
docker run -it -p 80:80 -p 443:443 -p 7080:7080 -p 8088:8088 -v /abc:/usr/local/lsws -d babim/litespeed
```

Volume:
```
/usr/local/lsws
or
usr/local/lsws/conf
usr/local/lsws/logs
```

## with environment ID:
```
auid = user id
agid = group id
auser = username
Default: agid = auid
```
## Environment ssh, cron option
```
SSH=false
SSHPASS=root (or you set)

CRON=false
NFS=false
SYNOLOGY=false
UPGRADE=false
FULLOPTION=true
```

## NFS option
Writing back to the host:
```
docker run -itd \
    --privileged=true \
    --net=host \
    --name nfs-movies \
    -v /media/nfs-movies:/mnt/nfs-1:shared \
    -e SERVER=192.168.0.9 \
    -e SHARE=movies \
    babim/........
```
```
default:
FSTYPE nfs4
MOUNT_OPTIONS nfsvers=4
MOUNTPOINT /mnt/nfs-1
---
max FSTYPE, MOUNT_OPTIONS, MOUNTPOINT
FSTYPE2
FSTYPE3
FSTYPE4
```