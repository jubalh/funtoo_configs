#!/bin/bash

ROOT_UID=0

if [ "$UID" -ne "$ROOT_UID" ]; then
    echo "No root privileges."
    exit $E_NOTROOT
fi

if [[ $1 == 'backup' ]] ; then
    mkdir -p ./configs
    cp /etc/portage/make.conf ./configs/make.conf
    cp /etc/portage/package.use ./configs/package.use
    cp /usr/src/linux/.config .configs/.config

    cat /var/lib/portage/world > packages
fi
