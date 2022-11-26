#!/bin/bash

# Building React output
npm install
npm run build

echo "DEPLOYING..."
echo "We are in $(pwd)"
echo "$(ls)"

echo "Changing to /build directory" 
cd build
echo "We are in $(pwd)"
echo "$(ls)"

echo "Creating ssh config file"
sshpass -p "jose" ssh -o "StrictHostKeyChecking no" production
echo "ssh config file created"

# rm -f ~/.ssh/known_hosts
# ssh-keyscan production >> /root/.ssh/known_hosts
ssh-keygen -R production

echo "Transfering files to production"
sshpass -p "jose" scp -r -o StrictHostKeyChecking=no /artifact/seguridad-saavedra/build seguridad@production:~/
echo "Transfer complete"

echo "DEPLOYED!"