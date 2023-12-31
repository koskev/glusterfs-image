#!/bin/bash -x

# Check if all required parameters are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <server> <id> <mountpoint>"
    exit 1
fi

server="$1"
id="$2"
mountpoint="$3"

mkdir -p $mountpoint
# Remove any stale mounts
umount $mountpoint

glusterfs --debug --no-daemon --volfile-server="$server" --volfile-id=/"$id" "$mountpoint"
