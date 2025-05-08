#!/bin/bash

# Install backend dependencies
cd Backend
pip install -r requirements.txt
cd ..

# Install frontend dependencies and build
cd Frontend/my-react-app-manual
npm install
npm run build

# Return to root
cd ../..

# Ensure the build output directory exists
mkdir -p Frontend/my-react-app-manual/dist 