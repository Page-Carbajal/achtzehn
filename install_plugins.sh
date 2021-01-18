vagrant box update;

# Installs Vagrant Env
printf "\n\nInstalling Vagrant Env plugin.\n\n"
vagrant plugin install vagrant-env;

# Installs Hosts Updater
printf "\n\nInstalling Vagrant Hosts Updater plugin.\n\n"
vagrant plugin install vagrant-hostsupdater;
