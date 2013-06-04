#!/sbin/busybox sh
#
# Script inicio lonas-init.sh
#

/sbin/busybox mount -o remount,rw /system
/sbin/busybox mount -t rootfs -o remount,rw rootfs

# Hacer Root
if [ ! -f /system/xbin/su ]; then
/sbin/busybox mv  /res/su /system/xbin/su
fi

/sbin/busybox chown 0.0 /system/xbin/su
/sbin/busybox chmod 06755 /system/xbin/su
/sbin/busybox symlink /system/xbin/su /system/bin/su

if [ ! -f /system/app/Superuser.apk ]; then
/sbin/busybox mv /res/Superuser.apk /system/app/Superuser.apk
fi

/sbin/busybox chown 0.0 /system/app/Superuser.apk
/sbin/busybox chmod 0644 /system/app/Superuser.apk

if [ ! -f /system/xbin/busybox ]; then
/sbin/busybox ln -s /sbin/busybox /system/xbin/busybox
/sbin/busybox ln -s /sbin/busybox /system/xbin/pkill
fi

if [ ! -f /system/bin/busybox ]; then
/sbin/busybox ln -s /sbin/busybox /system/bin/busybox
/sbin/busybox ln -s /sbin/busybox /system/bin/pkill
fi

# Instalador de STweaks
if [ ! -f /system/app/STweaks.apk ]; then
  cat /res/STweaks.apk > /system/app/STweaks.apk
/sbin/busybox chown 0.0 /system/app/STweaks.apk
/sbin/busybox chmod 644 /system/app/STweaks.apk
fi

mkswap /dev/block/zram0
swapon /dev/block/zram0

# Limpiador de otros kernel
/res/ext/limpiador.sh

# Detectar y generar INIT.D
/res/ext/init_d.sh

# Iniciar Bootanimation personalizado
/res/ext/bootanimation.sh

# Remontar y Optimizar particiones con EXT4
/res/ext/optimi_remount.sh

# Iniciar Tweaks Lonas_KL
/res/ext/tweaks.sh
/res/ext/tweaks_build.sh

# Soporte STweaks
/sbin/busybox rm /data/.lonas/customconfig.xml
/sbin/busybox rm /data/.lonas/action.cache

sync

/res/uci.sh apply

if [ -d /system/etc/init.d ]; then
  /sbin/busybox run-parts /system/etc/init.d
fi;

/sbin/busybox mount -t rootfs -o remount,ro rootfs
/sbin/busybox mount -o remount,ro /system
