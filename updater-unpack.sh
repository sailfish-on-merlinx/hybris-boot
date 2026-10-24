#!/system/bin/sh

FS_ARC="/data/sailfishos-rootfs.tar.bz2"
FS_DST="/data/.stowaways/sailfishos"
# Some recoveries (e.g. Lineage Recovery, toybox only) cannot decompress
# bzip2. Use the static busybox from the image when the zip ships one.
BB="/tmp/busybox-static"

rm -rf $FS_DST
mkdir -p $FS_DST
if [ -f $BB ]; then
    chmod 755 $BB
    $BB tar --numeric-owner -xjf $FS_ARC -C $FS_DST
else
    tar --numeric-owner -xvjf $FS_ARC -C $FS_DST
fi
EXIT=$?

rm $FS_ARC

exit $EXIT
