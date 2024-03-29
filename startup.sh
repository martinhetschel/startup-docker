# portainer
cd ~
docker volume create portainer_data
docker stop portainer
docker rm portainer
docker run -d -p 8000:8000 -p 9091:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --restart=unless-stopped --name=portainer portainer/portainer-ce --sslcert /var/certs/fullchain.pem --sslkey /var/certs/privkey.pem


# portainer 2.9.x but not working with ssl?!
docker run -d -p 9091:9443 -p 8000:8000 \
    --name portainer --restart unless-stopped \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    -v /etc/letsencrypt/live/test.qxf.de:/certs/live/test.qxf.de:ro \
    -v /etc/letsencrypt/archive/test.qxf.de:/certs/archive/test.qxf.de:ro \
    portainer/portainer-ce:latest --sslcert /certs/live/test.qxf.de/cert.pem --sslkey /certs/live/test.qxf.de/privkey.pem
    
    
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
