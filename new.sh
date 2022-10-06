#! /bin/sh
echo "--------------------------------------------"
echo "Welcome to the installation tool Wanna Stall"
echo "--------------------------------------------"

apt-get update -y
apt-get upgrade -y

echo '--------installation de curl--------'
sudo apt-get install curl -y



echo "--------installation de Visual Studio Code--------"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get install apt-transport-https -y
apt-get update && sudo apt-get install code -y

echo "--------configuration de git--------"
echo "Quelle nom voulez vous utilisez dans Git.name?"
echo "Par exemple le mien serait \"Azzarum\""
read git_config_user_name

echo "Quelle nom voulez vous utilisez dans Git.email?"
echo "Par exemple la mienne serait \"azzarum.o***@outlook.fr\""
read git_config_user_email

echo "Quelle nom voulez vous utilisez dans Git.username?"
echo "Par exemple le mien serait \azzarum\""
read username

echo '--------installation de nvm--------'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
sudo apt-get install -y nvm

echo '--------installation de nodejs lts--------'
nvm --version
nvm install --lts
nvm current
sudo apt-get update && sudo apt-get install nodejs-lts


echo "--------installation de npm--------"
apt-get install nodejs npm
ln -s /usr/bin/nodejs /usr/local/bin/node
ln -s /usr/bin/npm /usr/local/bin/npm
sudo apt install nodejs-legacy

echo "--------installation de lampp--------"

apt install apache2 php libapache2-mod-php mysql-server php-mysql
apt install apache2 php libapache2-mod-php mariadb-server php-mysql
apt install php-curl php-gd php-intl php-json php-mbstring php-xml php-zip
systemctl enable apache2
systemctl enable mysql
mkdir /opt/lampp/htdocs/www
chmod -R 755 /opt/lampp/htdocs/www
cd /opt/lampp/htdocs/www

echo "--------supprimer les paquets inutile --------"
sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
a2enmod rewrite
php5enmod mcrypt
clear
service apache2 restart

echo "nous avons installer lampp, nodejs, npm, nvm, git, curl, vscode"
echo "--------------------------------------------"
echo "Installation outils de base termine "
echo "--------------------------------------------"



