#!/bin/sh
#This simple script will install docker on your ubuntu machine and then it will run DVWA app on port 80
sudo apt-get update
echo "I'm Installing docker..."
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo "I'm pulling and running DWVA on your docker"
sudo docker pull vulnerables/web-dvwa
sudo docker run -d --restart always -p 80:80 vulnerables/web-dvwa
echo "There you go.... enjoy your DVWA ... or hack it ... or whatever :)"