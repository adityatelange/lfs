set +h
umask 022
export LFS=/drone/src/base
echo "exported ${LFS}"
export SRC=/drone/src
echo "exported ${SRC}"

mkdir -pv ${LFS}
