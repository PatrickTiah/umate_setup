#! /bin/bash

echo Copying setup script to /srv/ubuntu_mate_setup/
sudo mkdir /srv/ubuntu_mate_setup
sudo chmod -R 777 /srv/ubuntu_mate_setup
sudo cp -r . /srv/ubuntu_mate_setup

sudo exec > >(tee -i /srv/umate_setuplog.txt)
sudo exec 2>&1

echo Update and Upgrade
sudo apt update
sudo apt -y upgrade
sudo apt -y install net-tools

#install sssd for LDAP
echo Install sssd for LDAP
sudo apt install -y sssd sssd-tools
sudo cp sssd.conf /etc/sssd/sssd.conf

sudo cp Google_2028_06_22_3249.key /var/
sudo cp Google_2028_06_22_3249.crt /var/

sudo chown root:root /etc/sssd/sssd.conf
sudo chmod 600 /etc/sssd/sssd.conf
sudo service sssd restart
sudo pam-auth-update --enable mkhomedir

#enable SSH
sudo apt -y install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

#enable FTP
sudo apt -y install vsftpd
sudo cp vsftpd.conf /etc/vsftpd.conf
sudo systemctl enable --now vsftpd
sudo ufw allow 20/tcp
sudo ufw allow 21/tcp
sudo systemctl restart --now vsftpd

#install chrome
echo Install Chrome
wget -P /home/kadmin/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /home/kadmin/Downloads/google-chrome-stable_current_amd64.deb

#install Zoom
echo Install Zoom
sudo snap install zoom-client

#install anydesk
echo Install Anydesk
sudo dpkg -i anydesk_6.2.0-1_amd64.deb
sudo apt -y -f install

#install mandarin input
echo Install ibus Mandarin
sudo apt -y install ibus
sudo apt -y install ibus-pinyin
sudo apt -y -f install

#install pip for python
sudo apt -y install pip

#install Python modules
echo install python modules
pip install pandas
pip install openpyxl
pip install xlrd
pip install calendar

#install git
sudo apt -y install git

# add users and supervisor admin
echo Set user privileges
sudo cp lightdm.conf /etc/lightdm/lightdm.conf
sudo usermod -aG adm,cdrom,sudo,dip,plugdev,lpadmin,lxd,sambashare dev
sudo usermod -aG adm,cdrom,sudo,dip,plugdev,lpadmin,lxd,sambashare supervisor
sudo usermod -aG adm,cdrom,dip,plugdev,lpadmin,lxd,sambashare,users classroom
sudo usermod -aG adm,cdrom,dip,plugdev,lpadmin,lxd,sambashare,users bb_classroom
sudo usermod -aG adm,cdrom,dip,plugdev,lpadmin,lxd,sambashare,users cs_class_damai
sudo usermod -aG adm,cdrom,dip,plugdev,lpadmin,lxd,sambashare,users n_borealis
sudo usermod -aG adm,cdrom,dip,plugdev,lpadmin,lxd,sambashare,users n_bagan
sudo usermod -aG adm,cdrom,dip,plugdev,lpadmin,lxd,sambashare,users N_pangkor

sudo chage -E $(date -d +2days +%Y-%m-%d) kadmin
sudo chage -E `date +"%Y-%m-%d"` Teacher


