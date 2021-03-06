#!/bin/bash

color=$1

if [ -z ${color} ]; then
  echo "Usage: $0 <color of board to flash>"
  exit 1
fi

key="$(cat ~/.ssh/id_rsa.pub)"
arch="arm"
sed "s|<color>|${color}|" user-data.template.yml | sed "s|<user>|${USER}|" | sed "s|<ssh-key>|${key}|" | sed "s|<arch>|${arch}|"> user-data.generated

flash --hostname ${color} -u ./user-data.generated https://github.com/sealsystems/pi-gen/releases/download/v1.5.0/2017-04-09-pi-cloud-lite.zip
