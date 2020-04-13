#!/bin/bash


#system
sudo apt install software-properties-common apt-transport-https wget curl
#keyboard and language
setxkbmap -option grp:switch,grp:alt_shift_toggle us,ru



#google-chrome
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-key add linux_signing_key.pub
sudo apt-get update
sudo apt install google-chrome-stable

#code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt-get install -y code


#node
cd ~
curl -sL https://deb.nodesource.com/setup_13.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y  nodejs
sudo apt-get install -y  build-essential
sudo rm ~/nodesource_setup.sh

#go
cd ~
curl -O https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
tar xvf go1.14.2.linux-amd64.tar.gz
sudo rm ~/go1.14.2.linux-amd64.tar.gz
sudo chown -R root:root ./go
sudo mv go /usr/local

sudo sh -c "echo 'export GOPATH=$HOME/prog' >> /etc/profile"
sudo sh -c "echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> /etc/profile"
sudo sh -c "echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile"
source /etc/profile

#git
sudo apt install git
git config --global user.name "lakkinzimusic"
git config --global user.email "lakkinzimusic@gmail.com"

#mysql
wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.14-1_all.deb

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server
sudo su
mysql -e"ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';"
exit
sudo apt-get install -y mysql-workbench