#!/bin/bash

set -eux


_term() { 
  echo "Caught SIGTERM signal!" 
  umount -f /mnt/b2drop || true
  exit 0
}

trap _term SIGTERM


# Create /etc/davfs2/secrets
echo "/mnt/b2drop \"${B2DROP_USERNAME}\" \"${B2DROP_PASSWORD}\"" >> /etc/davfs2/secrets
chown root:root /etc/davfs2/secrets
chmod 600 /etc/davfs2/secrets

mkdir -p /mnt/b2drop
umount /mnt/b2drop || true
mount.davfs https://b2drop.eudat.eu/remote.php/webdav /mnt/b2drop

read tmp


umount /mnt/b2drop
