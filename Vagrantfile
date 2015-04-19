# -*- mode: ruby -*-
# vi: set ft=ruby :

provision = <<-EOT
  rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
  yum -y install ansible libselinux-python
  ansible-playbook /vagrant/provision/vagrant.yml --connection=local -vvv
EOT

# CentOSでsingle-request-reopenを有効にする
script = <<-EOT
  if [ ! $(grep single-request-reopen /etc/sysconfig/network) ]; then
    echo RES_OPTIONS=single-request-reopen >> /etc/sysconfig/network && service network restart;
  fi
EOT

Vagrant.configure(2) do |config|
  config.vm.box = "php-centos66"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provision "shell", inline: provision
  config.vm.provision "shell", inline: script
  config.vm.synced_folder "./", "/vagrant", id: "vagrant", :nfs => false, :mount_options => ["dmode=777","fmode=666"]

  config.vm.provision :serverspec do |spec|
    spec.pattern = "spec/default/*_spec.rb"
  end

end
