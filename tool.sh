#! /bin/sh

apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y
apt-get install libapache2-mod-php5 php5 php5-common php5-curl php5-dev php5-gd php5-idn php-pear php5-imagick php5-mcrypt php5-mysql php5-ps php5-pspell php5-recode php5-xsl -y
apt-get install mysql-server mysql-client libmysqlclient15.dev -y
apt-get install phpmyadmin -y
mkdir /var/www/web
mkdir /home/$USER/web/www
mkdir /home/$USER/web/www
ln -s /home/$USER/web/www /var/www/web/www
chown -hR $USER:users /home/$USER/web/www/
chmod -R 755 /home/$USER/web/www
chown -hR $USER:users  /var/www/web/www
chmod -R 755 /var/www/web/www

echo 'Installing curl' 
sudo apt-get install curl -y


echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Azzarum\""
read git_config_user_name

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"azzarum.off@outlook.fr\""
read git_config_user_email

echo "What is your github username?"
echo "For example, mine will be \azzarum\""
read username

echo "install vscode"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update && sudo apt-get install code -y

echo 'Installing Discord'
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
sudo apt-get install -f -y && rm discord.deb

echo 'Installing Spotify' 
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y




/*install nvm*/
echo 'Installing NVM'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
sudo apt-get install -y nvm

echo 'Installing NodeJS LTS'
nvm --version
nvm install --lts
nvm current
sudo apt-get update && sudo apt-get install nodejs-lts


echo 'Updating and Cleaning Unnecessary Packages'
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
a2enmod rewrite
php5enmod mcrypt
clear
service apache2 restart



