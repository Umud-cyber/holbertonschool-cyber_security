#!/bin/bash
sudo nmap -scanflags RUGACKPSHRSTSYNFIN -p $2 $1 -oN custom_scan.txt &> /dev/null
