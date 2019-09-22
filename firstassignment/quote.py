#!/usr/bin/env python3

# Import a python library
from collections import Counter

x = "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididun ut labore et dolore magna aliquat"

def Convert(string):
    li = list(string.split(" "))
    return li
   
print(Convert(x))

