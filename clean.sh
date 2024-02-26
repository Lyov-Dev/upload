#/bin/bash 

sync; echo 3 > /proc/sys/vm/drop_caches && printf '\n%s\n' 'Ram-cache Cleared'

