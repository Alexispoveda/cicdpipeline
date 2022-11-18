#!/bin/bash

# Building React output
npm install
npm run build

echo "Deploying to Deploying container"
echo "$(pwd)"
cp -r build/ artifact/

echo "Finished copying the build files"