#! /bin/bash

exec > >(tee -i /home/kadmin/umate_setuplog.txt)
exec 2>&1

#install Samba
sudo apt -y install samba
sudo cp smb.conf /etc/samba/smb.conf
sudo ufw allow samba
sudo mkdir /home/classroom/sambashare
sudo service smbd restart

