# stunnel: ssh reverse tunnel in a docker

## How it works
Let's assume we have a `SERVER` which is behind the firewall and we want to create reverse tunnel to a `JUMP SERVER`

### First of all create a `docker-compose.yml`, e.g.:
ON YOUR SERVER WHICH IS BEHIND THE FIREWALL
```sh
cd /
mkdir service.stunnel
cd service.stunnel
vim docker-compose.yml
%PASTE DOCKER COMPOSE FILE CONTENT FROM THIS REPOSITORY%
```

### Now generate ssh-key
ON YOUR SERVER WHICH IS BEHIND THE FIREWALL
```sh
mkdir ssh-key
ssh-keygen -t rsa -f /service.stunnel/ssh-key/id_rsa -q -P ""
```

> This ssh-key is needed to connect to your JUMP SERVER where we create a reverse tunnel to

### Add public key to `authorized_keys` file
ON YOUR JUMP SERVER
```sh
vim ~/.ssh/authorized_keys
%PASTE id_rsa.pub CONTENT%
```

## How to use it
```sh
cd /service.stunnel
docker-compose up -d
```