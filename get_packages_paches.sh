mkdir -v ${LFS}/sources
chmod -v a+wt ${LFS}/sources

# download all of the packages and patches 
wget --input-file=${x_SRC}/wget-list --continue --directory-prefix=${LFS}/sources

# verify that all the correct packages are available before proceeding
pushd $LFS/sources
md5sum -c md5sums
popd
