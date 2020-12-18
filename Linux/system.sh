#!/bin/bash/
# Free memory output to a free_mem.txt file

free -m > ~/backups/freemem/freemem.txt

# Disk usage output to a disk_usage.txt file

df -h > ~/backups/diskuse/diskuse.txt

# List open files to a open_list.txt file

lsof > ~/backups/openlist/openlist.txt

# Free disk space to a free_disk.txt file

df > ~/backups/freedisk/freedisk.txt
