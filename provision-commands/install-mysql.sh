# /*=============================
# =            MYSQL            =
# =============================*/
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password eagleWarrior'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password eagleWarrior'
sudo apt-get -y install mysql-server;
#sudo mysqladmin -uroot -proot create scotchbox
#sudo apt-get -y install php7.2-mysql

sudo systemctl restart apache2;
