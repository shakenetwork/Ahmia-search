#!/bin/bash
base_socks_port=9050
base_http_port=31000
base_control_port=8118

# Create data directory if it doesn't exist
if [ ! -d "data" ]; then
	mkdir "data"
fi


for i in {0..9}
do
	socks_port=$((base_socks_port+i))
	control_port=$((base_control_port+i))
	http_port=$((base_http_port+i))
	if [ ! -d "data/tor$i" ]; then
		echo "Creating directory data/tor$i"
		mkdir "data/tor$i"
	fi
	# Take into account that authentication for the control port is disabled. Must be used in secure and controlled environments
	echo "Running: tor --RunAsDaemon 1 --CookieAuthentication 0 --HashedControlPassword \"\" --ControlPort $control_port --PidFile tor$i.pid --SocksPort $socks_port --DataDirectory data/tor$i"
	tor --RunAsDaemon 1 --CookieAuthentication 0 --HashedControlPassword "" --ControlPort $control_port --PidFile tor$i.pid --SocksPort $socks_port --DataDirectory data/tor$i
	echo 	'Running: ./delegate/dg*/DGROOT/bin/dg9_9_13 -P$http_port SERVER=http SOCKS=localhost:$socks_port ADMIN="juha.nurmi@ahmia.fi"'
	./delegate/dg*/DGROOT/bin/dg9_9_13 -P$http_port SERVER=http SOCKS=localhost:$socks_port ADMIN="juha.nurmi@ahmia.fi"
done

haproxy -f rotating-tor-proxies.cfg
