#! /bin/bash

#install canon cque 
sudo dpkg -i cque-en-4.0-10.x86_64.deb
# driver for Bayan Baru
lpadmin -p BB_irADVC5235 -i /opt/cel/ppd/cel-iradvc5235-pcl-en.ppd.gz -v socket://192.168.0.123:9100 -E


