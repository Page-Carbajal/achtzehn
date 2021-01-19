# Zwanzig a Vagrant Local Environment

Based on [Bento / Ubuntu 20.04](https://app.vagrantup.com/bento/boxes/ubuntu-20.04).


## Installation

1. Clone this repository
2. Execute the file **install_plugins.sh** with this command: `  $ sudo chmod +x ./install_plugins.sh;  ./install_plugins.sh;`
3. Create your configuration files. If you are running running a Unix like SO, simply run this command: ` $ sudo chmod +x ./copy_config_files.sh; ./copy_config_files.sh;`
  - If you are running Windows you can always make a copy of the files directly
     - Create your Customfile from Customfile.sample
     - Create your .env file from sample.env


### Customizing the .env file

```
REPOSITORIES_PATH="/PATH/TO/REPOSITORIES"
LOCAL_DOMAINS="client01.dev, client02.dev"
```

1. REPOSITORIES_PATH should be set to the absolute path of your repositories
2. LOCAL_DOMAINS is a comma separated list of the domains to configure on your box



### Customizing the Customfile


This is the default content for the Customfile


```
# Enable .env support
config.env.enable


# Machine config
config.vm.provider "virtualbox" do |v|
  v.memory = 512
  v.cpus = 1
end


# Sync your repository folder as a shared resource
if File.directory?(File.expand_path(ENV['REPOSITORIES_PATH']))
    puts ""
    puts "REPOSITORIES FOLDER LOADED"
    puts ""
    config.vm.synced_folder ENV['REPOSITORIES_PATH'], "/var/sources", :mount_options => ["dmode=777", "fmode=666"]
end


# Hostnames
localDomains = ENV['LOCAL_DOMAINS'].split(/\s*,\s*/)
puts ""
puts "Adding the following Domains to your hosts file"
puts ""
puts localDomains
puts ""
config.hostsupdater.aliases = localDomains;


# SSH Access config
#config.ssh.username = "myuser"
#config.ssh.password = "mypass"
```

1. v.memory indicates the amount of RAM in MB you want to lock for this machine. 
  - Use up to 50% of your RAM
2. v.cpus locks a number of CPUs for your machine. 
  - 1 is fine, 2 is better

