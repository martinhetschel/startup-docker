# portainer
cd ~
docker volume create portainer_data
docker stop portainer
docker rm portainer
docker run -d -p 8000:8000 -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --restart=unless-stopped --name=portainer portainer/portainer

# Mosquitto
cd ~
git clone https://github.com/AM2H-Development/mqtt.git
cd mqtt
docker-compose up -d

# Influx
cd ~
git clone https://github.com/AM2H-Development/influx.git
cd influx
docker-compose up -d

# Theia und Nginx Reverse-Proxy
cd ~
git clone https://github.com/AM2H-Development/theia.git
cd theia
docker-compose up -d
docker network connect theia_reverse-proxy portainer
