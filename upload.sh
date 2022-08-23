#!/bin/sh

if [ -f equal ]; then
  echo "Equal game"
  exit 0;
fi

RELEASE=$(echo consul_*.deb)
upload_package upload --distro buster,bullseye public_apt "$RELEASE"
