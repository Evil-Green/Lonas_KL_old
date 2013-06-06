#!sh
#
# Tweaks Build - by Javilonas
#

# Fix para problemas Con aplicaciones
/sbin/busybox setprop ro.kernel.android.checkjni 0

# Aumenta el rendimiento de la respuesta táctil
/sbin/busybox setprop debug.performance.tuning 1
/sbin/busybox setprop video.accelerate.hw 1

# Incremento de memoria ram
/sbin/busybox setprop dalvik.vm.heapsize 192m

# Salvar bateria ahorrando en el wifi 
/sbin/busybox setprop wifi.supplicant_scan_interval 300
/sbin/busybox setprop ro.ril.disable.power.collapse 1
/sbin/busybox setprop pm.sleep_mode 1

