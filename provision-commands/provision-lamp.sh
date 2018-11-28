printf "\nInstalling Apache\n"
/provision-commands/install-apache.sh;
printf "\nInstalling PHP\n"
/provision-commands/install-php.sh;
printf "\nInstalling Composer\n"
/provision-commands/install-composer.sh;
printf "\nInstalling WP CLI\n"
/provision-commands/install-wpcli.sh;
printf "\nInstalling MySQL\n"
/provision-commands/install-mysql.sh;
#printf "\nInstalling Node\n"
#/provision-commands/install-node.sh;

if [[ -f "./setup-vhosts.sh" ]]; then
  sudo /provision-commands/setup-vhosts.sh
fi
