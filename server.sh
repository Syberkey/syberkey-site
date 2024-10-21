#!/bin/bash

# Build the site
hugo

# Start the server
cd public
python3 -m http.server 8080 &

# Wait for the server to start
sleep 2

# Set the correct MIME type for config.yml
curl -X POST http://localhost:8080/admin/config.yml \
  -H "Content-Type: text/yaml" \
  --data-binary @../admin/config.yml

# Keep the script running
wait