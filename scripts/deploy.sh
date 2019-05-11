#!/bin/bash
set -Eeu

echo "  ----- clone repository -----  "
git clone https://github.com/Artemmkin/raddit.git
echo

echo "  ----- install dependent gems -----  "
cd ./raddit
sudo bundle install
echo

echo "  ----- start the application -----  "
sudo systemctl start raddit
sudo systemctl enable raddit
echo
