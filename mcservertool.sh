#!/bin/bash

# This script first downloads minecraft server from Mojangs official site.
# It then creates a launch-script, that - when executed - initiates the server.

# Download url
URL=https://launcher.mojang.com/v1/objects/c5f6fb23c3876461d46ec380421e42b289789530/server.jar

# Download latest version of the server with wget
# '--limit-rate'- flag is used just for making sure,
# that the download won't use the full bandwidth,
# which could cause temporary, slower connection for others
# using the same network
# Use 'sleep' for 2 seconds in case of accidental execution
# '--progress'-flag is for configuring the progressbar of wget
echo 'Initiating download in...'
sleep 1
echo '  ====='
echo '  = 3 ='
echo '  ====='
sleep 1
echo '  ====='
echo '  = 2 ='
echo '  ====='
sleep 1
echo '  ====='
echo '  = 1 ='
echo '  ====='
sleep 1
wget --limit-rate=5m --progress=dot:mega --no-verbose --show-progress -O server.jar $(echo $URL)

# Create launch script for launching the server quickly
touch launch.sh
# Enable execution rights
chmod +x launch.sh

# Insert all necessary stuff into the launch-script
echo '#!/bin/bash' > launch.sh
printf '\n# Server launch settings\n' >> launch.sh
echo 'java -Xmx1024M -Xms1024M -jar server.jar nogui' >> launch.sh

echo ''
echo '==========================================================='
echo 'Execution script launch.sh created for launching the server'
echo 'Use it by typing: ./launch.sh and the server will start!'
echo 'If you wish to launch the server with more ram,'
echo 'then edit the launch.sh'
echo '==========================================================='
