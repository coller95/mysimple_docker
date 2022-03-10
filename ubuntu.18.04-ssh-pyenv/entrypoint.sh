#!/bin/sh

# Start the ssh server
/etc/init.d/ssh restart
su - ubuntu
# Execute the CMD
exec "$@"
