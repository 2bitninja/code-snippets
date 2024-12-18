# code-snippets
This repository contains some code snippets and small scripts for possible reuse.

## Table of Contents

* [File Descriptions](#file-descriptions)
	* [Case Statement](#case-statement)
	* [HERE-ILOMc](#here-ilomc)
	* [Notes](#notes)
	* [check-ports-PPSM](#check-ports-ppsm)
	* [grep-IP-MAC](#grep-ip-mac)
	* [Ping-to-IP](#ping-to-ip)
* [Commands and Variables](#commands-and-variables)

## File Descriptions 
### Case Statement
This code snippet demonstrates creating a case statement in BASH for making conditional choices.

 **Basic Case statement templete**
```
case $1 in
    -h|--help)
        printf '%s\n' 'foo command help:
-h, --help: Show this help
-q, --quiet: Run without diagnostics
-v, --verbose: Add extra diagnostics'
        exit 0
        ;;
    -v|--version)
	    echo -e "This is version 0.0.01"
        ;;	   
esac
```
Contents of the chose file
```bash
#!/bin/bash

read -p "Enter your choice [yes/no]:" choice
 
case $choice in
     yes)
          echo "Thank you"
          echo "Your type: Yes"
          ;;
     no)
          echo "Ooops"
          echo "You type: No"
          ;;
     *)
          echo "Sorry, invalid input"
          ;;
esac
```

### HERE-ILOMc
Used to retrieve MAC addresses from Integrated Lights Out of Management (ILOM) cards.

### Notes
Notes on various things, such as; SSH, VNC, ILOM, SED, xterm, etc

### check-ports-PPSM
Script for generating ports listing for security paperwork

### grep-IP-MAC
Gets IP address and MAC address on system for each device

### FISCAL
Script made for someone that wanted to output fiscal info for a univerity. Both version of the scripts do the exact same thing.

### Ping-to-IP
Script for getting an IP address from a hostname

## Commands and Variables  
### Open Aplications on a MAC
Web Browsers 
> open /Applications/Safari.app
> 
> open -a /Applications/Firefox.app
> 
> open -a /Applications/Google\ Chrome.app
> 
> open -a /Applications/Brave\ Browser.app
>

 ### BASH colors 
 To add colors to BASH out the VAR must be in the center.
 Example: ```echo -e "\e[1;33m Hello \e[0m"``` Hello will be displayed in yellow
 ```
\e{1;33m  \e[0m -- yellow
\e[1;33m  \e[0m -- orange
\e[1;33m  \e[0m -- dark orange
```
### SED Notes
**Replace**
``` 
sed -e '/pattern/pattern/'
```
__Replace Globally__
```
sed -e '/pattern/pattern/g'
```
**Delete line**
```
sed -i '/pattern/d' file
```
To use varibles inside the sed statement, use of double " instead of single '
```
sed -e "/$VAR1/$VAR2/"
```
### Basic case statement templete
```
case $1 in
    -h|--help)
        printf '%s\n' 'foo command help:
-h, --help: Show this help
-q, --quiet: Run without diagnostics
-v, --verbose: Add extra diagnostics'
        exit 0
        ;;
    -v|--version)
	    echo -e "This is version 0.0.01"
        ;;	   
esac
```

### Basic getopts templet
```
While getopts "hv" option; do
Case ${option} in
h)  echo "help message"
;;
v) echo "version number"
;;
# optional invalid option
\?) echo "you have entered an invalid option"
;;
esac
done
```
This is you can have custom options at the end of you script.

