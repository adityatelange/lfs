echo "##### installing requrements"
# adding symbolic link | fixes: ERROR: /bin/sh does not point to bash
ln -sf bash /bin/sh > /dev/null 2>&1
# Binutils, gcc , g++, xz, make, patch
apt-get -y update > /dev/null 2>&1
apt-get install -y --no-install-recommends build-essential > /dev/null 2>&1
# bison gwak m4 python3 makeinfo wget ca-certificates
apt-get install -y --no-install-recommends bison gawk m4 python3 texinfo wget ca-certificates > /dev/null 2>&1


echo "##### Check proper pachages installed"
bash ${SRC}/shared/version_config.sh


echo "##### Set Environment Variables"
set +h
umask 022
export LC_ALL=POSIX
export LFS_TGT=$(uname -m)-lfs-linux-gnu
export LFS=${SRC}/base
export PATH=${LFS}/tools/bin:/bin:/usr/bin
mkdir -pv ${LFS}


echo "##### Get Packages and Patches"
mkdir -v ${LFS}/sources
chmod -v a+wt ${LFS}/sources
# download all of the packages and patches 
wget --input-file=${SRC}/shared/wget_list --continue --directory-prefix=${LFS}/sources
# verify that all the correct packages are available before proceeding
pushd ${LFS}/sources
md5sum -c ${SRC}/shared/md5sums
popd

mkdir -v $LFS/tools
ln -sv $LFS/tools /

pushd ${LFS}/sources
    bash ${SRC}/building_packages/cross_binutils.sh
popd


pushd ${LFS}/sources
    bash ${SRC}/building_packages/cross_gcc.sh
popd