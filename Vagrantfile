# -*- mode: ruby -*-
# vi: set ft=ruby :
 
Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/trusty64"
 
    # Configs for web server 1
    config.vm.define :webserver1 do |webserver1_config|
        webserver1_config.vm.provider :virtualbox do |vb_config|
            vb_config.name = "Web Server 1 - lay4-hap1-web2"
        end
        webserver1_config.vm.hostname = "webserver1"
        webserver1_config.vm.network "private_network", ip: "192.168.50.10"
        webserver1_config.vm.provision :shell, path: "webserver.sh"
    end
 
    # Configs for web server 2
    config.vm.define :webserver2 do |webserver2_config|
        webserver2_config.vm.provider :virtualbox do |vb_config|
            vb_config.name = "Web Server 2 - lay4-hap1-web2"
        end
        webserver2_config.vm.hostname = "webserver2"
        webserver2_config.vm.network "private_network", ip: "192.168.50.20"
        webserver2_config.vm.provision :shell, path: "webserver.sh"
    end
 
    # Configs for haproxy
    config.vm.define :haproxy do |haproxy_config|
        haproxy_config.vm.provider :virtualbox do |vb_config|
            vb_config.name = "HAProxy - lay4-hap1-web2"
        end
        haproxy_config.vm.hostname = "haproxy"
        haproxy_config.vm.network :forwarded_port, guest: 80, host: 8080
        haproxy_config.vm.network "private_network", ip: "192.168.50.30"
        haproxy_config.vm.provision :shell, path: "haproxy.sh"
    end
end