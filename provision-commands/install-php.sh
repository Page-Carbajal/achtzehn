# /*===================================
# =            INSTALL PHP            =
# ===================================*/

# Install PHP
sudo add-apt-repository -y ppa:ondrej/php # Super Latest Version (currently 7.2)
sudo apt-get update
sudo apt-get install -y php8.0
sudo apt-get -y install libapache2-mod-php8.0
sudo apt install php8.0-fpm

# Add index.php to readable file types
MAKE_PHP_PRIORITY='<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>'
echo "$MAKE_PHP_PRIORITY" | sudo tee /etc/apache2/mods-enabled/dir.conf

sudo systemctl restart apache2;


# /*===================================
# =            PHP MODULES            =
# ===================================*/

# Base Stuff
sudo apt-get -y install php8.0-common
sudo apt-get -y install php8.0-dev
# Enchant
sudo apt-get -y install libenchant-dev
# LDAP
sudo apt-get -y install ldap-utils
# CURL
sudo apt-get -y install curl
# IMAGE MAGIC
sudo apt-get -y install imagemagick

# Common Useful Stuff (some of these are probably already installed)
# pear, xmlrpc, json have no installations candidates
sudo apt-get -y install php8.0-{bcmath,bz2,cgi,cli,curl,enchant,fpm,gd,imagick,imap,intl,ldap,mbstring,mysql,odbc,pspell,tidy,xml,zip,dom,mbstring,xml,xmlwriter};




# /*===========================================
# =            CUSTOM PHP SETTINGS            =
# ===========================================*/
PHP_USER_INI_PATH=/etc/php/8.0/apache2/conf.d/user.ini


echo 'display_startup_errors = On' | sudo tee -a $PHP_USER_INI_PATH
echo 'display_errors = On' | sudo tee -a $PHP_USER_INI_PATH
echo 'error_reporting = E_ALL' | sudo tee -a $PHP_USER_INI_PATH
echo 'short_open_tag = On' | sudo tee -a $PHP_USER_INI_PATH
sudo systemctl restart apache2

# Disable PHP Zend OPcache
echo 'opache.enable = 0' | sudo tee -a $PHP_USER_INI_PATH

# Absolutely Force Zend OPcache off...
sudo sed -i s,\;opcache.enable=0,opcache.enable=0,g /etc/php/8.0/apache2/php.ini
sudo systemctl restart apache2


# /*================================
# =            PHP UNIT            =
# ================================*/
sudo wget -O phpunit https://phar.phpunit.de/phpunit-8.phar;
sudo chmod +x phpunit;
sudo mv phpunit /usr/local/bin/phpunit;
sudo systemctl restart apache2;
