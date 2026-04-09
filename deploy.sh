#!/bin/bash
set -e

KEY="$HOME/.ssh/web-server-key.pem"
HOST="ubuntu@3.231.50.180"
REMOTE_DIR="/var/www/portfolio"

echo "Cleaning remote directory..."
ssh -i  "$KEY" -o StrictHostKeyChecking=no $HOST "sudo rm -rf $REMOTE_DIR/*"

echo "Copying files..."

scp -i "$KEY" -o StrictHostKeyChecking=no index.html $HOST:$REMOTE_DIR/

scp -i "$KEY" -o StrictHostKeyChecking=no -r images $HOST:$REMOTE_DIR/


echo "Deployment done 🚀"
