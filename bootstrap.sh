#!/usr/bin/env bash

# Install git
apt-get update
apt-get install -y git

# Install node.js 
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y nodejs

# Install mongodb
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
apt-get update
apt-get install -y mongodb-org
systemctl enable mongod
systemctl start mongod
sleep 5s

# Configure and restart mongodb
cat > mongo.js << EOF
use admin
db.createUser( { user: "admin", pwd: "admin", roles: [ { role: "root", db: "admin" } ] } )
use nodebb
db.createUser( { user: "nodebb", pwd: "nodebb", roles: [ { role: "readWrite", db: "nodebb" }, { role: "clusterMonitor", db: "admin" } ] } )
EOF
mongo < mongo.js
echo "security:" | tee -a /etc/mongod.conf
echo "  authorization: enabled" | tee -a /etc/mongod.conf
systemctl restart mongod
rm mongo.js

# Install nodebb
mkdir -p /usr/src
cd /usr/src
git clone -b v1.16.x https://github.com/NodeBB/NodeBB.git app
cd app

# Configure nodebb
mkdir node_modules
cat > config.json << EOF
{
    "url": "http://localhost:4567",
    "secret": "6d36be40-d68e-4c8e-ac87-439a8c30f581",
    "database": "mongo",
    "mongo": {
        "host": "127.0.0.1",
        "port": "27017",
        "username": "nodebb",
        "password": "nodebb",
        "database": "nodebb",
        "uri": ""
    }
}
EOF
chown -R vagrant:vagrant .

# Link this plugin source to the VM and nodebb itself
ln -fs /vagrant /usr/src/app/node_modules/nodebb-theme-encontext