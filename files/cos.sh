#!/bin/bash

#set the COSes
sudo pqos -e "llc:15=0xFFFFF;"
sudo pqos -e "llc:14=0x7FFFF;"
sudo pqos -e "llc:13=0x7FFF;"
sudo pqos -e "llc:12=0x3FF;"
sudo pqos -e "llc:11=0x1F;"
sudo pqos -e "llc:10=0x1;"

#assign cores
sudo pqos -a "llc:15=15"
sudo pqos -a "llc:14=14"
sudo pqos -a "llc:13=13"
sudo pqos -a "llc:12=12"
sudo pqos -a "llc:11=11"
sudo pqos -a "llc:10=10"
