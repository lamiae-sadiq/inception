#/bin/bash

service monitorix restart
#restart the server to work properly

nc -l -p 1212 #makes the container on
# -l : Puts 'nc' in listening mode, waiting for incoming connections.
# -p : Specifies the source port 'nc' should use, subject to privilege restrictions and availability.
