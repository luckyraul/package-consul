#!/bin/sh
latest=`cat latest`
apt -qq update
apt install -qqy software-properties-common
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt -qq update
apt download consul
RELEASE=$(echo consul_*.deb)
version=$(echo "$RELEASE" | awk -F '_' '{ print $2 }')
echo "Most recent Consul version $version"
echo "Comparing with version $latest"
if [ "$version" = "$latest" ]; then echo "EQUAL"; touch equal; else echo "NOT EQUAL";fi;
