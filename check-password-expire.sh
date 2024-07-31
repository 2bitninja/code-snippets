#!/bin/bash
# check-password-expire.sh
# Created/Last updated on 20230609
# Created to check for account expriation

if [[ $(/usr/bin/id -u) -ne 0 ]]
then echo "Must run script as root"
exit
fi

echo -e "Expires on \tAccount Name\n-----------------------------"
for s in $(cat /etc/passwd|egrep -v 'nologin|shutdown|halt|sync'|cut -d: -f1)
#do echo -e "$s\t$(chage -l $s |grep "Password expires"|cut -d: -f2)"
do 	
	echo -e "$(chage -l $s |grep "Password expires"|cut -d: -f2)\t$s "
done
