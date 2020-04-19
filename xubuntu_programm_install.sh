#!/bin/bash


#system
apt install -y software-properties-common apt-transport-https wget curl
#keyboard and language
setxkbmap -option grp:switch,grp:alt_shift_toggle us,ru



#google-chrome
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
apt-key add linux_signing_key.pub
apt-get update
apt install -y google-chrome-stable

#code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update
apt-get install -y code


#node
cd ~
curl -sL https://deb.nodesource.com/setup_13.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt-get install -y  nodejs
apt-get install -y  build-essential
rm ~/nodesource_setup.sh

#go
cd ~
curl -O https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
tar xvf go1.14.2.linux-amd64.tar.gz
rm ~/go1.14.2.linux-amd64.tar.gz
chown -R root:root ./go
mv go /usr/local

sh -c "echo 'export GOPATH=$HOME/prog' >> /etc/profile"
sh -c "echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> /etc/profile"
sh -c "echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile"
source /etc/profile

#git
sudo apt install -y git
git config --global user.name "lakkinzimusic"
git config --global user.email "lakkinzimusic@gmail.com"

#mysql
wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb
dpkg -i mysql-apt-config_0.8.14-1_all.deb

DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server
mysql -e"ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';"
exit
apt-get install -y mysql-workbench


#terminator
apt install terminator
cp -r ./terminator /home/lakkinzimusic/.config/


#appearence
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/image-style -t int -s 0


#shortcuts
xfconf-query --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Primary><Alt>t" --create --type string --set "terminator"
xfconf-query --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Super>q" --create --type string --set "terminator"
xfconf-query --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Super>up" --create --type string --set "maximize_window_key"
