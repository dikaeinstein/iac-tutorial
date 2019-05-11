#!/bin/bash
set -Eeu

echo "  ----- install ruby and bundler -----  "
apt-get update
apt-get install -y ruby-full build-essential
gem install --no-rdoc --no-ri bundler
echo

echo "  ----- install mongodb -----  "
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
apt-get update
apt-get install -y mongodb-org
echo

echo "  ----- start mongod -----  "
systemctl start mongod
systemctl enable mongod
echo

echo "  ----- copy unit file for application -----  "
wget https://gist.githubusercontent.com/Artemmkin/ce82397cfc69d912df9cd648a8d69bec/raw/7193a36c9661c6b90e7e482d256865f085a853f2/raddit.service
mv raddit.service /etc/systemd/system/raddit.service
echo
