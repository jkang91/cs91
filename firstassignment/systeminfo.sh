#!/bin/bash

# This script creates a file called problem3part1.txt which has the following information:
# 1. Memory, CPU, and disk space information
# 2. List of the files in the common log path (/var/log)
# 3. Contains the string "New session" in auth.log

# Create the file
touch problem3part1.txt

# Append Memory, CPU, Disk Info
echo "Memory, CPU, and Disk Info" >> problem3part1.txt
(less /proc/meminfo && less /proc/cpuinfo && df) >> problem3part1.txt

# Append Files in Common Log Path
echo "Common Log Path files" >> problem3part1.txt
ls -p /var/log | grep -v / >> problem3part1.txt

# Append New Session entries in auth.log
echo "New Session entries" >> problem3part1.txt
cat /var/log/auth.log | grep "New session" >> problem3part1.txt
