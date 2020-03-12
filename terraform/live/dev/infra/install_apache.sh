#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo service httpd start
echo "<h1>Hello Plexure</h1>" | sudo tee /var/www/html/index.html
sudo service httpd restart
