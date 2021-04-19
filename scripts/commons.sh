#!/bin/bash
#Update and install nginx
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo apt-get install python3-certbot-nginx -y
sudo cat > /etc/nginx/conf.d/api.conf << EOL
server {
    listen 80;
    server_name ec2.morijo.com.br;
    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOL
sudo certbot --nginx --preferred-challenges http -d ec2.morijo.com.br -m jpmorijo@gmail.com --redirec --agree-tos  --quiet
sudo service nginx restart

#Install Cloudwatch agent
wget -c -P /tmp/ https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E /tmp/amazon-cloudwatch-agent.deb
sudo amazon-cloudwatch-agent-ctl -a start
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Install SSM
sudo snap install amazon-ssm-agent --classic
sudo systemctl start snap.amazon-ssm-agent.amazon-ssm-agent.service

#Install Docker
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo systemctl start docker

#Run docker
sudo docker run -p 5000:5000 -e AWS_ACCESS_KEY_ID="" \
-e AWS_SECRET_ACCESS_KEY="" \
-e AWS_DEFAULT_REGION=us-east-1 jpmorijo/aws-api