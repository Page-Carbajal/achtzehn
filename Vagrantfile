Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

    config.vm.hostname = "bionic-beaver"
    config.vm.network "forwarded_port", guest: 80, host: 80
    config.vm.network "private_network", ip: "192.168.10.100"
    config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]
    config.ssh.insert_key = false

    #config.vm.provision "shell", path: "install.sh", privileged: false

    # Load custom configurations from Customfile if exists
    if File.exists?(File.join('Customfile')) then
        eval(IO.read(File.join('Customfile')), binding)
    end
end
