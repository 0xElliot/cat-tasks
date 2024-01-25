#!/bin/bash 

# connect to warp
warp-cli connect
sleep 3
ifconfig CloudflareWARP > /dev/null 2>&1

# check the connect
if [ $? -eq 0 ] 
then
	# connect to vpn 
	read -p "enter vpn file path : " vpn_file
	sudo openvpn $vpn_file 2>/dev/null&
else 
	echo "there is an error in warp"
fi

# check to connection to THM ping
ping 10.10.10.10 -c 3 

# disconnect the warp
warp-cli disconnect