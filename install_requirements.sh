echo "##### installing requrements"
# adding symbolic link | fixes: ERROR: /bin/sh does not point to bash
ln -sf bash /bin/sh > /dev/null 2>&1

# Binutils, gcc , g++, xz, make, patch
apt-get -y update > /dev/null 2>&1
apt-get install -y --no-install-recommends build-essential > /dev/null 2>&1

# bison gwak m4 python3 makeinfo wget ca-certificates
apt-get install -y --no-install-recommends bison gawk m4 python3 texinfo wget ca-certificates > /dev/null 2>&1