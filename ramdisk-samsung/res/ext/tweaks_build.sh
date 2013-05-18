#!sh
#
# Tweaks Build - by Javilonas
#

# Fix para problemas Con aplicaciones
setprop ro.kernel.android.checkjni 0

# Aumenta el rendimiento de la respuesta táctil
setprop debug.performance.tuning 1
setprop video.accelerate.hw 1

# Incremento de memoria ram
setprop dalvik.vm.heapsize 192m

# Higest Photo and Video Quality
setprop ro.media.enc.jpeg.quality 100
setprop ro.media.dec.jpeg.memcap 8000000
setprop ro.media.enc.hprof.vid.bps 8000000
setprop ro.media.dec.aud.wma.enabled 1
setprop ro.media.dec.vid.wmv.enabled 1
#setprop ro.media.cam.preview.fps 0
#setprop ro.media.codec_priority_for_thumb so

# Disminuir el retardo mientra se realiza una llamada
setprop ro.telephony.call_ring.delay 0

# Salvar bateria ahorrando en el wifi 
setprop wifi.supplicant_scan_interval 300
setprop ro.ril.disable.power.collapse 1
setprop pm.sleep_mode 1

