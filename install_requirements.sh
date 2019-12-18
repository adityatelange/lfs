# adding symbolic link | fixes: ERROR: /bin/sh does not point to bash
ln -sf bash /bin/sh 

apt-get -y update 
apt-get install build-essential
