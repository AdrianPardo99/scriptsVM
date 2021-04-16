#!/usr/bin/env bash

# Script para montar ip estatica y que
#   sea persistente en equipos basados en debian

if [ "$EUID" -ne 0 ];then
  echo "Error, please execute the script as root"
  exit 1
fi

if [[ $# -ne 4 ]];then
  echo -e "Error\n\tUsage: $0 <Interface> <IP> <Netmask> <Gateway>"
  exit 2
fi

interface=$1
ip=$2
net=$3
gate=$4
echo -e "auto ${interface}\niface ${interface} inet static\n\taddress ${ip}\n\tnetmask ${net}\n\tgateway ${gate}" >> /etc/network/interfaces
/etc/init.d/network restart
