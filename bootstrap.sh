#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
echo "<html><body><h1>Welcome to My Static Web Page!</h1></body></html>" | sudo tee /var/www/html/index.html
sudo systemctl enable apache2
sudo systemctl start apache2
