#!/bin/bash
find "$1" -type f -perm /6000 -o -mtime -1 -exec ls -l {} \;
