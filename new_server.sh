#!/bin/bash

echo ""
echo "================================="
echo "==  New Server Script Start  =="
echo "================================="
echo ""
if [[ $EUID -ne 0 ]]; then 
		echo "======================================================================="
		echo "==                  This Script Must Be run As ROOT                  =="
		echo "======================================================================="
   exit 1 
	fi

	echo "=========================================================================="
	echo "==    Updates / SSH Server / htop / vim / curl / Aria2 / DevTools / vlc =="
	echo "=========================================================================="
	echo -e "\e[93m>>>>> Installing Updates <<<<<\e[0m"
	echo -e ""
	apt-get update && apt-get install -y \
		openssh-server\
		htop\
		vim\
		curl\
		aria2\
		net-tools\

	echo "====================================="
	echo "==    Download & Install docker    =="
	echo "====================================="
	echo -e "\e[93m>>>>> Installing docker <<<<<\e[0m"
	echo -e "" 
	apt-get install -y \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common
	
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	
	add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"
		
	apt-get install -y docker-ce docker-ce-cli containerd.io

	echo "============================================="
	echo "==    Download & Install docker-compose    =="
	echo "============================================="
	echo -e "\e[93m>>>>> Installing docker-compose <<<<<\e[0m"
	echo -e ""
	curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose

	echo "====================================="
	echo "==    Download & Install python    =="
	echo "====================================="
	echo -e "\e[93m>>>>> Installing python <<<<<\e[0m"
	echo -e ""	
	apt-get install -y python3.7
	cd /tmp
		wget https://bootstrap.pypa.io/get-pip.py -o get-pip.py
		python get-pip.py

	echo "======================================"
	echo "==    Download & Install Jenkins    =="
	echo "======================================"
	apt-get install -y openjdk-8-jdk
	wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
	sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
  	  /etc/apt/sources.list.d/jenkins.list'
	apt get update
	apt-get install -y jenkins

echo ""
echo "================"
echo "==    Done    =="
echo "================"
