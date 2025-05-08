#!/bin/bash

# Install backend dependencies
cd Backend
pip install -r requirements.txt
cd ..

# Remove existing node_modules and package-lock.json to resolve integrity issues
rm -rf package-lock.json node_modules

# Install frontend dependencies and build
cd Frontend/my-react-app-manual

# Clear npm cache
npm cache clean --force

# Retry npm install up to 3 times
for i in {1..3}; do
  npm install && break
  echo "Retrying npm install ($i/3)..."
done

npm run build

# Return to root
cd ../..

# Ensure the build output directory exists
mkdir -p Frontend/my-react-app-manual/dist

# Copy the build output to the dist directory
cp -r Frontend/my-react-app-manual/dist/* Frontend/my-react-app-manual/dist/

# Return to root
cd ../..