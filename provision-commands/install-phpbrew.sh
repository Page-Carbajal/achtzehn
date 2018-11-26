curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew

# Move phpbrew to somewhere can be found by your $PATH
sudo mv phpbrew /usr/local/bin/phpbrew

# Init
phpbrew init

# I assume you're using bash
echo "[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc" >> ~/.bashrc

# For the first-time installation, you don't have phpbrew shell function yet.
source ~/.phpbrew/bashrc

# Fetch the release list from official php site...
phpbrew update

# List available releases
phpbrew known

# List available variants
phpbrew variants
