#!/bin/sh
# Script to take a PCAP network capture file and try to extract useful
# information such as clear text, passwords, users, emails, CC data etc
# Ensure ngrep,tcpick are installed.
# written by D Kirkpatrick

ARGS=1
FILE="$1"
###################################################
if [ $# -ne "$ARGS" ]; then
printf "Usage: `basename $0` file.pcap \n "
echo "Searches a pcap file for useful information"
exit 0
fi
#########################################
# Search Criteria
########################################
# show hosts of IP traffic
echo "Show hosts"
echo "=========="
tshark -r $FILE -q -z hosts,ipv4
# Show Hierarcy stats using tshark (-z option is for listing stats)
echo "Show hierarchy"
echo "=============="
tshark -r $FILE -q -z io,phs
# Show all traffic and dest port info
echo "Show all sessions and destination ports"
echo "======================================="
tshark -o column.format:'"Source", "%s", "Destination", "%d", "dstport", "%uD"' -r $FILE |sort|uniq
# List the top talkers, and sort by number of bytes sent by each
echo "Top Talkers For All Traffic"
echo "============================="
echo
echo -e '# of Pkts \t IP Addr'
echo -e '========= \t ======='
tcpdump -tnr $FILE |awk -F '.' '{print $1"."$2"."$3"."$4}' | sort | uniq -c | sort -n | tail
# Show all conversations and port detail using tshark filters"
echo "Show all conversation"
echo "====================="
 tshark -o column.format:'"Source", "%s", "Destination", "%d", "dstport", "%uD"' -r $FILE |sort|uniq
# Show all TCP streams
echo "Show TCP Streams"
echo "================"
tshark -r $FILE -q -z conv,tcp
# Search for any word with user
echo "Show any packes with "User" in it"
echo "================================="
ngrep -q -I $FILE|grep -i user
# Search for any word with pass
echo "Show any words with "Pass" in it"
echo "================================"
ngrep -q -I $FILE|grep -i pass
# Search for emails
echo "Find anything looking like an email address"
echo "==========================================="
ngrep -q -I $FILE '[a-zA-Z0-9.]+\.?@[a-zA-Z0-9.]+\.[a-zA-Z0-9]+' |grep -Eo '[a-zA-Z0-9.]+\.?@[a-zA-Z0-9.]+\.[a-zA-Z0-9]+'|sort|uniq
# Look at TCP data in printable form
echo "Show Port 25 data"
echo "================="
tcpick -r $FILE -yP "port 25"
echo "Show Port 21 data"
echo "================="
tcpick -r $FILE -yP "port 21"
echo "Show Port 23 data"
echo "================="
tcpick -r $FILE -yP "port 23"
echo "Show Port 80 data"
echo "================="
tcpick -r $FILE -yP "port 80"
echo "Show all TCP flows"
echo "=================="
tcpick -r $FILE -C
