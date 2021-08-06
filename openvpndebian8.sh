#!/bin/bash
#
# Original script by fornesia, rzengineer and fawzya
# Mod by admin white-vps
# ==================================================


# update repository
apt-get update

# Install OpenVPN dan Easy-RSA
apt-get install openvpn easy-rsa

# copykan script generate Easy-RSA ke direktori OpenVPN
cp -r /usr/share/easy-rsa/ /root

# Buat direktori baru untuk easy-rsa keys
mkdir /root/easy-rsa/keys

# Kemudian edit file variabel easy-rsa
# nano /etc/openvpn/easy-rsa/vars
wget -O /root/easy-rsa/vars "https://raw.githubusercontent.com/predators46/wanted/master/vars.conf"
# edit projek export KEY_NAME="white-vps"
# Save dan keluar dari editor

# generate Diffie hellman parameters
openssl dhparam -out /root/dh2048.pem 2048

# inialisasikan Public Key
cd /root/easy-rsa
. ./vars
./clean-all
# Certificate Authority (CA)
./build-ca

# buat server key name yang telah kita buat sebelum nya yakni "white-vps"
./build-key-server OpenWrt Firmware Custom

# generate ta.key
openvpn --genkey --secret keys/ta.key


exit

# cek di direktori clientconfig "/etc/openvpn/easy-rsa/keys/" hrs nya ada 4 file yaitu:
# masuk ke root vps kemudian arahkan ke directory "/etc/openvpn/easy-rsa/keys"
# ca.crt
# ta.key
# config-udp.ovpn
# config-tcp.ovpn
# download ke 4 file tersebut dan untuk CA input manual ke dalam config TCP dan UDP

# Test create account opevpn dengan perintah Berikut :
# "useradd -s /bin/false white-vps" ===>>> white-vps disini artinya username yg kita buat adalah white-vps
# "passwd white-vps" =====>>> masukan perintah ini untuk set password dari username white-vps tadi
# kemudian masukan passwr,,lanjut step akhir test vpn
