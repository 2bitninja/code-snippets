#!/bin/bash
# Created on 20180521
# Clean up & added DLA-SPLUNK-DATA 20180524 
# Removed IPv6 excetion due to missing open ports 20180519
sudo /bin/netstat -nutlp|egrep -v '(LISTENING|127.0.0.1|Active|Proto)'|awk '{print ","$NF,$1,","$4}' |sed -e 's/ /,/g' \
-e '/Xvnc/c\,Xvnc,tcp,VNC,5900,6000' -e '/splunkd/c\,splunkd,tcp,SPLUNK DEPLOYMENT MANAGER,8089' \
-e '/nessusd/c\,Nessus,TCP,Tenable Nessus Administrator Web User Interface,8834' \
-e '/mongod/c\,Splunk,tcp,DLA-SPLUNK-DATA,8191' -e '/:111/c\,NFS,tcp,DLA-NFS,111,111\n,NFS,udp,DLA-NFS,111,111' \
-e '/:123/c\,NTP,udp,Network Time Protocol,123,123' \
-e '/6[0-1][0-9][5-9]/c\,Informatica PowerCenter,tcp,TRANSCOM-INFORMATICA-POWERCENTER,6005,6105' \
-e '/60[10-14]/c\,Informatica PowerCenter,tcp,TRANSCOM-INFORMATICA-POWERCENTER,6005,6105' \
-e '/:2049/c\,NTP,tcp,Network Time Protocol,2049,2049\n,NTP,udp,Network Time Protocol,2049,2049' \
-e '/:404[5-7]/c\,NFS,tcp,USAF-NFS,4045,4047\n,NFS,udp,USAF-NFS,4045,4047' \
-e '/:777[7-8]/c\,Oracle HTTP Server,Oracle Application Server Hypertext Transfer Protocol over Secure Sockets Layer,7777,7778' | while read line
do  echo -e "$(hostname -I),$line"|sed  -e 's/[[:digit:]]\+\///'  
done|grep -v 127.0.0.1|sort -u 
