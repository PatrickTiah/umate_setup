#! /bin/bash

#install canon cque 
sudo dpkg -i cque-en-4.0-10.x86_64.deb
# driver for Cheras
lpadmin -p CS_irADVC5235 -i /opt/cel/ppd/cel-iradvc5235-pcl-en.ppd.gz -v socket://192.168.0.100:9100 -E


