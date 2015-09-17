#!/bin/bash
mkdir -p ~/tmp
mkdir -p ~/tmp/msflogs
service postgresql start
service metasploit start
msfconsole | tee /root/msf.`date +%m-%d-%Y_%H-%M-%S`.log
