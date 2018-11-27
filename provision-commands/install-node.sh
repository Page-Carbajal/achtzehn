# /*==============================
# =            NODEJS            =
# ==============================*/
sudo apt-get -y install nodejs
sudo apt-get -y install npm

# Use NVM though to make life easy
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 10.13.0

# Node Packages
# sudo npm install -g gulp
# sudo npm install -g grunt
# sudo npm install -g bower
# sudo npm install -g yo
# sudo npm install -g browser-sync
# sudo npm install -g browserify
# sudo npm install -g pm2
sudo npm install -g webpack
