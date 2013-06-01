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

# Higest Photo and Video Quality
/sbin/busybox setprop ro.media.enc.jpeg.quality 100
/sbin/busybox setprop ro.media.dec.jpeg.memcap 8000000
/sbin/busybox setprop ro.media.enc.hprof.vid.bps 8000000
/sbin/busybox setprop ro.media.dec.aud.wma.enabled 1
/sbin/busybox setprop ro.media.dec.vid.wmv.enabled 1

# Disminuir el retardo mientra se realiza una llamada
/sbin/busybox setprop ro.telephony.call_ring.delay 0

# Salvar bateria ahorrando en el wifi 
/sbin/busybox setprop wifi.supplicant_scan_interval 300
/sbin/busybox setprop ro.ril.disable.power.collapse 1
/sbin/busybox setprop pm.sleep_mode 1

