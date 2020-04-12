#!/bin/bash

sudo apt install software-properties-common apt-transport-https wget curl


#google-chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update

#code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code


#node
cd ~
curl -sL https://deb.nodesource.com/setup_13.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
sudo apt install build-essential

#go
cd ~
curl -O https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
tar xvf go1.10.3.linux-amd64.tar.gz
sudo chown -R root:root ./go
sudo mv go /usr/local

sudo sh -c "echo 'export GOPATH=$HOME/prog' >> ~/.profile"
sudo sh -c "echo 'PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.profile"
source ~/.profile

echo "# shells_collection" >> README.md
git init
git add *
git commit -m "first commit"
git remote add origin https://github.com/lakkinzimusic/shells_collection.git
git push -u origin master