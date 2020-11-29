#!/bin/bash

# This script first downloads minecraft server 
# from Mojangs official site.
# It then creates a launch-script, that - when executed 
# - initiates the server.

# Download url
URL=https://launcher.mojang.com/v1/objects/c5f6fb23c3876461d46ec380421e42b289789530/server.jar

function countdown() {

echo 'Initiating download in...'
sleep 1
echo '3'
sleep 1
echo '2'
sleep 1
echo '1'
sleep 1

}

# If server already exists, then do conditional stuff
if [[ -e server.jar ]]
then
	echo '========================================================'
	echo 'SERVER.JAR ALREADY EXISTS!'
	echo '========================================================'
	echo 'IF YOU ARE SURE THAT YOU WANT TO DOWNLOAD ANYWAY, IF FOR'
	echo 'EXAMPLE NEWER VERSION OF THE SERVER IS AVAILABLE,'
	echo 'THEN TYPE: yes or no'
	echo '========================================================'
	read -p 'Install anyway?: ' install_anyway

	if [[ $install_anyway == 'yes' ]]
	then
		# Do countdown before excuting the download
		countdown
		wget --limit-rate=5m --progress=dot:mega --no-verbose --show-progress -O server.jar $(echo $URL)
	fi

	if [[ $install_anyway == 'no' ]]
	then
		# Quit
		echo 'Mission aborted...'
	fi

else
	# Do countdown before excuting the download
	countdown
	wget --limit-rate=5m --progress=dot:mega --no-verbose --show-progress -O server.jar $(echo $URL)

	# Create launch script for launching the server quickly
	touch launch.sh

	# Enable execution rights
	chmod +x launch.sh

	# Insert all necessary stuff into the launch-script
	echo '#!/bin/bash' > launch.sh
	printf '\n# Server launch settings\n' >> launch.sh
	echo 'java -Xmx1024M -Xms512M -jar server.jar nogui' >> launch.sh

	echo ''
	echo '==========================================================='
	echo 'Execution script launch.sh created for launching the server'
	echo 'Use it by typing: ./launch.sh and the server will start!'
	echo 'If you wish to launch the server with more ram, then edit'
	echo 'the launch.sh'
	echo '==========================================================='
fi

