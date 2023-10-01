#!/bin/bash
# Script for 
# Usage: Ping-to-IP $1
ping -c1 $1 |grep PING|awk '{print $3}'|sed -e 's/(//' -e 's/)//'
