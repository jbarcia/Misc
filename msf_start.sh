#!/bin/bash
mkdir -p ~/tmp
mkdir -p ~/tmp/msflogs
# Start the Postgresql Database
/etc/init.d/postgresql start
# Initialize the Metasploit Framework Database
msfdb init
# Run msfconsole
msfconsole | tee /root/msf.`date +%m-%d-%Y_%H-%M-%S`.log