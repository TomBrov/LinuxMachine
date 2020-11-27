#!/bin/bash

echo ""
echo "================================="
echo "==  New Computer Script Start  =="
echo "================================="
echo ""
if [[ $EUID -ne 0 ]]; then 
		echo "======================================================================="
		echo "==                  This Script Must Be run As ROOT                  =="
		echo "======================================================================="
   exit 1 
	fi

	echo "=======================================================================================\n"
	echo "==    Updates / SSH Server / htop / vim / curl / Aria2 / DevTools / vlc / Git-Crypt  =="
	echo "======================================================================================="
	echo -e "\e[93m>>>>> Installing Updates <<<<<\e[0m"
	echo -e ""
	apt-get update && apt-get install -y \
		openssh-server\
		htop\
		vim\
		curl\
		aria2\
		net-tools\
		vlc\
		git-crypt

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

cd /tmp
	echo "======================================================================="
	echo "==                     Download & Install Chrome                     =="
	echo "======================================================================="
	echo -e "\e[93m>>>>> Installing chrome <<<<<\e[0m"
	echo -e ""	
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo apt install ./google-chrome-stable_current_amd64.deb -y 
	

        echo "======================================================================="
	echo "==                   Download & Install TeamViewer                   =="
	echo "======================================================================="
	echo -e "\e[93m>>>>> Installing TeamViewer <<<<<\e[0m"
	echo -e ""	
	wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb && sudo apt install ./teamviewer_amd64.deb -y

cd /home
        echo "===================================================================="
	echo "==                   Download & Install Spotify                   =="
	echo "===================================================================="
	echo -e "\e[93m>>>>> Installing spotify <<<<<\e[0m"
	echo -e ""	
	snap install -y spotify

    echo "===================================================================="
	echo "==                   Download & Install Postman                   =="
	echo "===================================================================="
	echo -e "\e[93m>>>>> Installing Postman <<<<<\e[0m"
	echo -e ""	
	snap install -y postman

        echo "==================================================================="
	echo "==                  Download & Install Pycharm                  =="
	echo "==================================================================="
	echo -e "\e[93m>>>>> Installing Visual Studio Code <<<<<\e[0m"
	echo -e ""	
	snap install pycharm-community --classic

echo ""
echo "================"
echo "==    Done    =="
echo "================"
