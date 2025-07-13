#! /bin/bash

echo Copying sssd update script to /srv/ubuntu_mate_setup/
sudo mkdir /srv/ssd_update_2025
sudo chmod -R 777 /srv/ssd_update_2025
sudo cp -r . /srv/ssd_update_2025

sudo exec > >(tee -i /srv/ssd_update_2025_setuplog.txt)
sudo exec 2>&1

echo Update /etc/sssd/sssd.conf
sudo cp sssd.conf /etc/sssd/sssd.conf

sudo cp Google_2028_06_22_3249.key /var/
sudo cp Google_2028_06_22_3249.crt /var/

sudo chown root:root /etc/sssd/sssd.conf
sudo chmod 600 /etc/sssd/sssd.conf
sudo service sssd restart
sudo pam-auth-update --enable mkhomedir

#enable SSH
sudo systemctl enable ssh
sudo systemctl start ssh


# add users and supervisor admin
echo Set user privileges
sudo usermod -aG adm,cdrom,dip,plugdev,lpadmin,lxd,sambashare,users bb_classroom
sudo usermod -aG adm,cdrom,dip,plugdev,lpadmin,lxd,sambashare,users cs_class_damai
sudo usermod -aG adm,cdrom,dip,plugdev,lpadmin,lxd,sambashare,users n_borealis
sudo usermod -aG adm,cdrom,dip,plugdev,lpadmin,lxd,sambashare,users n_bagan
sudo usermod -aG adm,cdrom,dip,plugdev,lpadmin,lxd,sambashare,users N_pangkor

read "Done"
