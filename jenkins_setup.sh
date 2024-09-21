#!/bin/bash
 sudo apt update

 #install java jdk 11 or 8
 sudo apt install openjdk-11-jdk -y

#Step 2: Add Jenkins Repository
sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null

sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

#Step 3: Install Jenkins but update first
sudo apt update

sudo apt install jenkins -y

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins to start on boot
sudo systemctl enable jenkins

# Print Jenkins status
sudo systemctl status jenkins

#Modify Firewall to Allow Jenkins
sudo ufw allow 8080

# Print the initial admin password for Jenkins
echo "Jenkins initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword