# Install the package
sudo add-apt-repository -y ppa:ondrej/apache2 # Super Latest Version
sudo apt-get update
sudo apt-get -y install apache2

# Rename html directory to public
if [ -d "/var/www/html" ]; then
    sudo mv /var/www/html /var/www/public
fi

# Disable default sites
sudo a2dissite 000-default;


# Delete defautl sites enabled
if [ -f "/etc/apache2/sites-available/000-default.conf" ]; then
  sudo rm /etc/apache2/sites-available/000-default.conf
fi

# Clean VHOST with full permissions
MY_WEB_CONFIG='<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/public
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    <Directory "/var/www/public">
        Options Indexes FollowSymLinks
        AllowOverride all
        Require all granted
    </Directory>
</VirtualHost>'
echo "$MY_WEB_CONFIG" | sudo tee /etc/apache2/sites-available/000-default.conf

Squash annoying FQDN warning
echo "ServerName achtzehn" | sudo tee /etc/apache2/conf-available/servername.conf
sudo a2enconf servername

# Enabled missing h5bp modules (https://github.com/h5bp/server-configs-apache)
sudo a2enmod expires
sudo a2enmod headers
sudo a2enmod include
sudo a2enmod rewrite

sudo systemctl restart apache2
