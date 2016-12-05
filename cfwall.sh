#!/bin/bash
####################################
# Limit http to cloudflare ip ranges
####################################


ufw reset
ufw allow ssh
cfips='103.21.244.0/22 
103.22.200.0/22 
103.31.4.0/22 
104.16.0.0/12 
108.162.192.0/18 
131.0.72.0/22 
141.101.64.0/18 
162.158.0.0/15 
172.64.0.0/13 
173.245.48.0/20 
188.114.96.0/20 
190.93.240.0/20 
197.234.240.0/22 
198.41.128.0/17 
199.27.128.0/21 '

for i in `echo $cfips`;do

ufw allow in on eth0 to any port 80 proto tcp from "$i"
ufw allow in on eth0 to any port 443 proto tcp from "$i"

done

ufw enable

read -p "are you still here? (y/n)" here
if [[ $here == "y" ]] ;then
  exit 0
else 
  ufw disable
  exit 1
fi
