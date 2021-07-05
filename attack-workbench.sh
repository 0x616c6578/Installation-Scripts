function install-docker {
    sudo yum install -y yum-utils
    sudo yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum install docker-ce docker-ce-cli containerd.io
}

function install-docker-composer {
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose  
}

function start-docker {
    sudo systemctl enable docker
    sudo systemctl start docker
}

function install-attack-workbench {
    mkdir attack-workbench
    git clone https://github.com/center-for-threat-informed-defense/attack-workbench-frontend.git
    git clone https://github.com/center-for-threat-informed-defense/attack-workbench-collection-manager.git
    git clone https://github.com/center-for-threat-informed-defense/attack-workbench-rest-api.git
    cd attack-workbench-frontend/
    sudo docker-compose up
}

install-docker
start-docker
install-docker-compose
install-attack-workbench