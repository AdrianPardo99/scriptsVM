#!/usr/bin/env bash

# Script para habilitar el cipher de cisco en debian

if [ "$EUID" -ne 0 ];then
  echo "Error, please execute the script as root"
  exit 1
fi


echo -e "\tKexAlgorithms diffie-hellman-group1-sha1,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha1\n\tCiphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc" >> /etc/ssh/ssh_config
/etc/init.d/ssh restart
