#!/bin/bash
yum -y update
yum -y install httpd
echo "<h2>WebServer HM_EP2</h2>" > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd
