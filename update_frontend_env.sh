#!/bin/bash
# Usage: ./update_frontend_env.sh <NGROK_URL>
# Example: ./update_frontend_env.sh https://xxxx.ngrok-free.app

if [ -z "$1" ]; then
  echo "Usage: $0 <NGROK_URL>"
  exit 1
fi

ENV_FILE="./frontend/.env"

if [ ! -f "$ENV_FILE" ]; then
  echo ".env file not found in frontend directory!"
  exit 1
fi

sed -i "s|^VITE_BACKEND_URL=.*$|VITE_BACKEND_URL=$1|" "$ENV_FILE"
echo "VITE_BACKEND_URL mis à jour dans $ENV_FILE : $1"
