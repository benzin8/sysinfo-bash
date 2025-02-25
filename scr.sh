#!/bin/bash

if ping -c 1 google.com &> /dev/null
then echo "Connection Successful"
else echo "Connection Error"
fi

echo "\n===SystemInfo==="
echo "Hostname: $(hostname)"
echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d '"' -f 2)"

echo -e "\n===NetInfo==="
echo "Internal IP: $(hostname -I | awk '{print $1}')"
external_ip=$(curl -s ifconfig.me)
if [ -n "$external_ip" ];
then 
	echo "External IP: ${external_ip}"
else
	echo "Fail to get Exeternal IP"
fi
exit 0
