#!/sbin/busybox sh
#
# Script inicio lonas-init.sh
#

/sbin/busybox mount -o remount,rw /system
/sbin/busybox mount -t rootfs -o remount,rw rootfs

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

/res/uci.sh apply

if [ -d /system/etc/init.d ]; then
  /sbin/busybox run-parts /system/etc/init.d
fi;

/sbin/busybox mount -t rootfs -o remount,ro rootfs
/sbin/busybox mount -o remount,ro /system
