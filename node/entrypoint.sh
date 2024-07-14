#!/bin/bash

cd /home/container

export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Ask the user for the Node.js version
echo "Available Node.js versions:"
echo "1: Nodejs 12"
echo "2: Nodejs 14"
echo "3: Nodejs 16"
echo "4: Nodejs 17"
echo "5: Nodejs 18"
echo "6: Nodejs 19"
echo "7: Nodejs 20"
echo "8: Nodejs 21"
read -p "Enter the number for the desired Node.js version: " version

case $version in
  1) NODE_IMAGE="ghcr.io/parkervcp/yolks:nodejs_12" ;;
  2) NODE_IMAGE="ghcr.io/parkervcp/yolks:nodejs_14" ;;
  3) NODE_IMAGE="ghcr.io/parkervcp/yolks:nodejs_16" ;;
  4) NODE_IMAGE="ghcr.io/parkervcp/yolks:nodejs_17" ;;
  5) NODE_IMAGE="ghcr.io/parkervcp/yolks:nodejs_18" ;;
  6) NODE_IMAGE="ghcr.io/parkervcp/yolks:nodejs_19" ;;
  7) NODE_IMAGE="ghcr.io/parkervcp/yolks:nodejs_20" ;;
  8) NODE_IMAGE="ghcr.io/parkervcp/yolks:nodejs_21" ;;
  *) echo "Invalid selection"; exit 1 ;;
esac

# Pull and run the selected Node.js Docker image
docker pull $NODE_IMAGE
docker run -it --rm -v $(pwd):/home/container $NODE_IMAGE /bin/bash

# Make sure npm packages are installed if package.json exists
if [ -f /home/container/package.json ]; then
  npm install
fi

# Start the Node.js application
if [ -f /home/container/${MAIN_FILE} ]; then
  node /home/container/${MAIN_FILE} ${NODE_ARGS}
else
  echo "Main file not found!"
  exit 1
fi
