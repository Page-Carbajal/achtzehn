Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.hostname = "bionic-beaver"
    config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "private_network", ip: "192.168.10.100"
    #config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]
    config.ssh.insert_key = false

    # Sync provision-commands folder
    if File.directory?(File.expand_path("./provision-commands"))
        puts ""
        puts "REPOSITORIES FOLDER LOADED"
        puts ""
        config.vm.synced_folder "./provision-commands", "/provision-commands", :mount_options => ["dmode=755", "fmode=755"]
    end


    # Load custom configurations from Customfile if exists
    if File.exists?(File.join('Customfile')) then
        eval(IO.read(File.join('Customfile')), binding)
    end

    if File.exists?(File.join('provision-commands/install.sh')) then
      config.vm.provision "shell", path: "provision-commands/install.sh", privileged: false
    end
end
