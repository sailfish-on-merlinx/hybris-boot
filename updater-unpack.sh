#!/system/bin/sh

FS_ARC="/data/sailfishos-rootfs.tar.bz2"
FS_DST="/data/.stowaways/sailfishos"

rm -rf $FS_DST
mkdir -p $FS_DST
# Lineage Recovery has no /sbin and only toybox (no bzip2/bzcat links),
# so call the toybox applets explicitly when available.
if [ -x /system/bin/toybox ]; then
    /system/bin/toybox bzcat $FS_ARC | /system/bin/toybox tar --numeric-owner -xvf - -C $FS_DST
else
    tar --numeric-owner -xvjf $FS_ARC -C $FS_DST
fi
EXIT=$?

rm $FS_ARC

exit $EXIT
