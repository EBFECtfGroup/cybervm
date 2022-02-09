#!/usr/bin/env bash
set -ex

apt-get update
apt-get upgrade -y
apt-get install -y gdb gcc python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential

# pwntools
python3 -m pip install --upgrade pwntools
# gef
if [ "$INSTALL_GEF" == "yes" ]; then
    bash -c "$(curl -fsSL http://gef.blah.cat/sh)"
fi
if [ "$INSTALL_PWNDBG" == "yes" ]; then
    cd /home/vagrant/
    sudo -u vagrant git clone https://github.com/pwndbg/pwndbg
    cd pwndbg
    sudo -u vagrant ./setup.sh
    cd /
fi
