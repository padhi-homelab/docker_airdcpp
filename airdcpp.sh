#!/bin/sh

set -e

cd /airdcpp

if ! [ -d config ]; then
  cp -R /default_config/* /config/
  ln -s /config
fi

./airdcppd
