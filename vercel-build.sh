#!/bin/bash

# Install backend dependencies
cd Backend
pip install -r requirements.txt
cd ..

# Remove existing node_modules and package-lock.json to resolve integrity issues
cd Frontend/my-react-app-manual
rm -rf package-lock.json node_modules

# Clear npm cache
npm cache clean --force

# Retry npm install up to 3 times
for i in {1..3}; do
  npm install && break
  echo "Retrying npm install ($i/3)..."
done

# Run the build command
npm run build

# Return to root
cd ../..