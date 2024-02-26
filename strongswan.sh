#!/bin/bash

IP=195.250.79.33

  

sudo apt-get update -y
 
sudo apt-get upgrade -y

sudo apt-get install strongswan -y

sudo apt-get install libstrongswan-standard-plugins -y

sudo apt-get install strongswan-pki -y
 

cd /etc/ipsec.d
ipsec pki --gen --type rsa --size 4096 --outform pem > private/ca.pem 
ipsec pki --self --ca --lifetime 3650 --in private/ca.pem \
type rsa --digest sha256 --dn "CN=$IP" --outform pem > cacerts/ca.pem 
ipsec pki --gen --type rsa --size 4096 --outform pem > private/ubuntu.pem 
ipsec pki --pub --in private/ubuntu.pem --type rsa 
ipsec pki --issue --lifetime 3650 --digest sha256 \
--cacert cacerts/ca.pem --cakey private/ca.pem --dn "CN=$IP" --san $IP \
--flag serverAuth \--outform pem > certs/ubuntu.pem && \
ipsec pki --gen --type rsa --size 4096 --outform pem > private/me.pem 
ipsec pki --pub --in private/me.pem --type rsa | 
ipsec pki --issue --lifetime 3650 --digest sha256 --cacert cacerts/ca.pem --cakey private/ca.pem --dn "CN=me" --san me --flag clientAuth --outform pem > certs/me.pem 
rm -f /etc/ipsec.d/private/ca.pem 
rm -f /etc/ipsec.conf 
echo "config setup
        uniqueids=never
        charondebug="ike 2, knl 2, cfg 2, net 2, esp 2, dmn 2,  mgr 2"
conn %default
        keyexchange=ikev2
        ike=aes128gcm16-sha2_256-prfsha256-ecp256!
        esp=aes128gcm16-sha2_256-ecp256!
        fragmentation=yes
        rekey=no
        compress=yes
        dpdaction=clear
        left=%any
        leftauth=pubkey
        leftsourceip=$IP
        leftid=$IP
        leftcert=ubuntu.pem
        leftsendcert=always
        leftsubnet=0.0.0.0/0
        right=%any
        rightauth=pubkey
        rightsourceip=10.10.10.0/24
        rightdns=8.8.8.8,8.8.4.4
conn ikev2-pubkey
        auto=add" > /etc/ipsec.conf 
echo ': RSA ubuntu.pem' >> etc/ipsec.secrets 
ipsec restart && echo 'net.ipv4.ip_forward=1\nnet.ipv4.conf.all.accept_redirects = 0\nnet.ipv4.conf.all.send_redirects = 0\nnet.ipv4.ip_no_pmtu_disc = 1' >> /etc/sysctl.conf 
sysctl -p

apt-get install iptables-persistent 
iptables -P INPUT ACCEPT 
iptables -P FORWARD ACCEPT 
iptables -F 
iptables -Z 
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT  
iptables -A INPUT -p tcp --dport 22 -j ACCEPT 
iptables -A INPUT -i lo -j ACCEPT 
iptables -A INPUT -p udp --dport  500 -j ACCEPT 
iptables -A INPUT -p udp --dport 4500 -j ACCEPT 
iptables -A FORWARD --match policy --pol ipsec --dir in  --proto esp -s 10.10.10.0/24 -j ACCEPT  
iptables -A FORWARD --match policy --pol ipsec --dir out --proto esp -d 10.10.10.0/24 -j ACCEPT 
iptables -t nat -A POSTROUTING -s 10.10.10.0/24 -o eth0 -m policy --pol ipsec --dir out -j ACCEPT 
iptables -t nat -A POSTROUTING -s 10.10.10.0/24 -o eth0 -j MASQUERADE 
iptables -t mangle -A FORWARD --match policy --pol ipsec --dir in -s 10.10.10.0/24 -o eth0 -p tcp -m tcp \ 
--tcp-flags SYN,RST SYN -m tcpmss --mss 1361:1536 -j TCPMSS --set-mss 1360 
iptables -A INPUT -j DROP 
iptables -A FORWARD -j DROP 

netfilter-persistent save && netfilter-persistent reload -y
 

wget https://gist.githubusercontent.com/borisovonline/955b7c583c049464c878bbe43329a521/raw/b2d9dba73da633fcfcca6a03d877517c5b2d9485/mobileconfig.sh
sudo chmod u+x mobileconfig.sh 
apt-get install zsh -y

bash mobileconfig.sh > iphone.mobileconfig

reboot 



