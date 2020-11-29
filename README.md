# Minecraft Server Download Script (MSDS)

Script that downloads the Minecraft server.jar from Mojangs website
and then creates a launch-script for executing the server.

Works on MacOS and Linux!

## Requirements
* `wget`
* `java (OpenJDK)` 	 

## Install
* git clone https://github.com/nikkelarsson/Minecraft-Server-Download.git

## Usage
1. Make sure you have JDK installed
* If you DON'T have JDK, install it with:

**MacOS**
```
brew cask install adoptopenjdk
```

**Debian, Ubuntu, Raspbian**
```
sudo apt-get install openjdk-8-jdk
```

**Arch**
```
pacman -S jdk8-openjdk
```

**Solus** 
```
sudo eopkg install openjdk-8
```

2. Use `chmod +x mcservertool.sh` to enable execution rights 
3. Execute `./mcservertool.sh` to download the server.jar
4. Once the download is complete, two files should be in your current folder `server.jar` and `launch.sh`
5. Use `launch.sh` to start the server (the script enables exe-rights to the `launch.sh` automatically)

Happy minecrafting!
