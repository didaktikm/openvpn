#!/bin/env bash
cd /etc/openvpn/
/usr/share/easy-rsa/3.0.3/easyrsa init-pki
echo 'rasvpn' | /usr/share/easy-rsa/3.0.3/easyrsa build-ca nopass
echo 'rasvpn' | /usr/share/easy-rsa/3.0.3/easyrsa gen-req server nopass
echo 'yes' | /usr/share/easy-rsa/3.0.3/easyrsa sign-req server server
/usr/share/easy-rsa/3.0.3/easyrsa gen-dh
openvpn --genkey --secret ta.key
echo 'iroute 192.168.33.0 255.255.255.0' > /etc/openvpn/client/client