# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX = ENV['BOX'] || "centos-6.5-vbox-4.6.2-chef-11.10.0-2014.02.10"

Vagrant.configure("2") do |config|
    config.berkshelf.enabled = false
    config.omnibus.chef_version = '11.6.2'
  config.vm.provider :virtualbox do |provider, override|
    override.vm.box = "debain"
    override.vm.box_url = "https://s3-eu-west-1.amazonaws.com/ffuenf-vagrant-boxes/debian/debian-7.1.0-amd64.box"
  end
  %w{ staging production }.each_with_index do |type, index|
    config.vm.define type do |node|
      node.vm.network :private_network, ip: "33.33.33.#{index+10}"      
      node.vm.host_name = type
      node.vm.provision :chef_client do |chef|
        chef.chef_server_url = 'http://10.0.2.2:8889' # HOST CHEF-ZERO SERVER
        chef.validation_key_path = '.chef/validator.pem'
        chef.encrypted_data_bag_secret_key_path = '.chef/encrypted_data_bag_secret'
        chef.node_name = type
        node_file = File.expand_path "../nodes/#{type}.json", __FILE__
        if File.exists? node_file
          node_json = JSON.parse(IO.read(node_file))
          chef.json.merge! node_json
        end
      end
    end
  end
end
