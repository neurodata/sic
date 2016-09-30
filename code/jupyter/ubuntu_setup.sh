# https://docs.docker.com/engine/installation/linux/ubuntulinux/

sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo su
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
exit

sudo apt-get update
sudo apt-get purge lxc-docker
sudo apt-cache policy docker-engine
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

sudo apt-get install -y docker-engine
sudo service docker start

sudo groupadd docker
sudo usermod -aG docker $USER

#then logout and back in
