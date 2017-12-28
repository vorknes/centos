#!/bin/bash
#082210988552

read -p "Username : " kerdunet
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=`curl icanhazip.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $kerdunet
exp="$(chage -l $kerdunet | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $kerdunet &> /dev/null
echo -e ""
echo -e "----------------------------"
echo -e "Data Login:
echo -e "----------------------------"
echo -e "Host: $IP"
echo -e "Port: 22, 143, 443, 109, 110"
echo -e "Username: $Login "
echo -e "Password: $Pass"
echo -e "Config OpenVPN: $IP:81/1194-client.ovpn"
echo -e "Aktif Sampai: $exp"
echo -e "----------------------------"
