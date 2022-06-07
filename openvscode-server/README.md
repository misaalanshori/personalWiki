# openvscode-server

Things about setting up [openvscode-server on docker](https://github.com/linuxserver/docker-openvscode-server) using the linuxserver.io image.

## Notes

- I can't change the internal listening port without forking the docker files.
- I haven't found a way to change the username or hostname, its just stuck with abc@{randomnumbers}
- It uses web sockets, so make sure to also proxy that when using apache.
- It seems like programs installed in the container are persistent, so I won't need to reconfigure everything. Though a short list of commands to setup my commonly used programming languages will be in this readme.

## Files
Files in this folder

### apachevirtualhost.conf
The Virtual Host file to proxy the openvscode-server HTTP connections and also WebSocket Connections. Also contains simple basic authentication to put the page behind a username and password. Another thing to note is that Apache 2.4.48 is the minimum to get WebSocket proxy to work. These modules also needs to be enabled: proxy, proxy_http, proxy_wstunnel

### docker-compose.yml
A docker-compose file for the linuxserver openvscode-server image. Mounts 2 folders, a config folder for the and a gits folder, and also maps 4 ports, 1 for the Web UI and 3 other ports to be used by running projects inside the container. 

## Scripts
The following is a short script to install software for C/C++, Python, Javascript/NodeJS, and Golang.
```
sudo apt update -y
sudo apt install curl git mercurial make binutils bison gcc tcc build-essential -y # Installs GVM requirements, and also GCC for C/C++
sudo apt install python3 python3-pip -y # Install Python
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer) $ Install GVM for Golang
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash # Install NVM for NodeJS, though refer to https://github.com/nvm-sh/nvm for latest versions
```
### Scripts Notes
- Make sure to set the Go default with GVM, For example `gvm use go1.18.3 --default`