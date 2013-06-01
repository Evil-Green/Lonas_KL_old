#!/sbin/busybox sh
#
# Limpiador de Kernel - by Javilonas
#

# drop caches to free some memory
sync
echo "3" > /proc/sys/vm/drop_caches

#remove cache, tmp, and unused files
/sbin/busybox rm -f /cache/*.apk
/sbin/busybox rm -f /cache/*.tmp
/sbin/busybox rm -f /data/dalvik-cache/*.apk
/sbin/busybox rm -f /data/dalvik-cache/*.tmp

if [ -e /data/.siyah ]; then
	/sbin/busybox rm -r -f /data/.siyah
fi;

if [ -e /data/.perseus ]; then
	/sbin/busybox rm -r -f /data/.perseus
fi;

if [ -e /data/.adamkernel ]; then
	/sbin/busybox rm -r -f /data/.adamkernel
fi;

if [ -e /data/.temasek ]; then
	/sbin/busybox rm -r -f /data/.temasek
fi;

