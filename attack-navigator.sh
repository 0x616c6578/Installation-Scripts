#!/bin/bash


# Install preprequisite packages
sudo yum install nodejs
sudo npm install -g @angular/cli

# Install the attack navigator
git clone https://github.com/mitre-attack/attack-navigator.git
cd attack-navigator/nav-app/
sudo npm install

# Download offline assets
cd src/assets/
wget https://raw.githubusercontent.com/mitre/cti/master/enterprise-attack/enterprise-attack.json
wget https://raw.githubusercontent.com/mitre/cti/master/mobile-attack/mobile-attack.json
wget https://raw.githubusercontent.com/mitre/cti/master/ics-attack/ics-attack.json

# Configure attack navigator to use offline assets
sed -i "s\https://raw.githubusercontent.com/mitre/cti/ATT%26CK-v8.1/enterprise-attack/enterprise-attack.json\assets/enterprise-attack.json\g" config.json
sed -i "s\https://raw.githubusercontent.com/mitre/cti/ATT%26CK-v8.1/mobile-attack/mobile-attack.json\assets/mobile-attack.json\g" config.json
sed -i "s\https://raw.githubusercontent.com/mitre/cti/ATT%26CK-v8.1/ics-attack/ics-attack.json\assets/ics-attack.json\g" config.json

# Start the application
cd ../..
ng serve
# Open firefox, browse to localhost:4200