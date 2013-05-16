#!/sbin/busybox sh
#
# Tweaks - by Javilonas
#


# drop caches to free some memory
sync
echo "3" > /proc/sys/vm/drop_caches

# Miscellaneous tweaks
echo "4096" > /proc/sys/vm/min_free_kbytes
echo "1000" > /proc/sys/vm/dirty_writeback_centisecs
echo "500" > /proc/sys/vm/dirty_expire_centisecs
echo "0" > /proc/sys/vm/oom_kill_allocating_task
echo "0" > /proc/sys/vm/swappiness
#echo "0" > /proc/sys/vm/block_dump
echo "50" > /proc/sys/vm/vfs_cache_pressure
echo "90" > /proc/sys/vm/dirty_ratio
echo "70" > /proc/sys/vm/dirty_background_ratio

#echo "0" > /proc/sys/vm/laptop_mode
#echo "0" > /proc/sys/vm/panic_on_oom 
echo "8" > /proc/sys/vm/page-cluster
echo "10" > /proc/sys/fs/lease-break-time
echo "64000" > /proc/sys/kernel/msgmni
echo "64000" > /proc/sys/kernel/msgmax
echo "500,512000,64,2048" > /proc/sys/kernel/sem
 
# Tweaks internos
echo "-1" > /sys/devices/system/gpu/time_in_state
echo "2" > /sys/devices/system/cpu/sched_mc_power_savings
echo "0" > /proc/sys/kernel/randomize_va_space
echo "3" > /sys/module/cpuidle_exynos4/parameters/enable_mask
 
# IPv6 privacy tweak
echo "2" > /proc/sys/net/ipv6/conf/all/use_tempaddr
 
# TCP tweaks
echo "0" > /proc/sys/net/ipv4/tcp_timestamps;
echo "1" > /proc/sys/net/ipv4/tcp_tw_reuse;
echo "1" > /proc/sys/net/ipv4/tcp_sack;
echo "1" > /proc/sys/net/ipv4/tcp_tw_recycle;
echo "1" > /proc/sys/net/ipv4/tcp_window_scaling;
echo "2" > /proc/sys/net/ipv4/tcp_syn_retries;
echo "2" > /proc/sys/net/ipv4/tcp_synack_retries;
echo "5" > /proc/sys/net/ipv4/tcp_keepalive_probes;
echo "10" > /proc/sys/net/ipv4/tcp_keepalive_intvl;
echo "10" > /proc/sys/net/ipv4/tcp_fin_timeout;
echo "404480" > /proc/sys/net/core/wmem_max;
echo "404480" > /proc/sys/net/core/rmem_max;
echo "256960" > /proc/sys/net/core/rmem_default;
echo "256960" > /proc/sys/net/core/wmem_default;
echo "4096,16384,404480" > /proc/sys/net/ipv4/tcp_wmem;
echo "4096,87380,404480" > /proc/sys/net/ipv4/tcp_rmem;

LOOP=`ls -d /sys/block/loop*`
RAM=`ls -d /sys/block/ram*`
MMC=`ls -d /sys/block/mmc*`
ZRAM=`ls -d /sys/block/zram*`

for i in $LOOP $RAM $MMC $ZRAM
do 
echo "row" > $i/queue/scheduler
echo "0" > $i/queue/add_random
echo "0" > $i/queue/rotational
echo "8192" > $i/queue/nr_requests
echo "0" > $i/queue/iostats
echo "1" > $i/queue/iosched/back_seek_penalty
echo "2" > $i/queue/iosched/slice_idle
done

# Turn off debugging for certain modules
echo "0" > /sys/module/wakelock/parameters/debug_mask
echo "0" > /sys/module/userwakelock/parameters/debug_mask
echo "0" > /sys/module/earlysuspend/parameters/debug_mask
echo "0" > /sys/module/alarm/parameters/debug_mask
echo "0" > /sys/module/alarm_dev/parameters/debug_mask
echo "0" > /sys/module/binder/parameters/debug_mask
echo "0" > /sys/module/lowmemorykiller/parameters/debug_level
echo "0" > /sys/module/mali/parameters/mali_debug_level
echo "0" > /sys/module/ump/parameters/ump_debug_level

# Zero dumpstate files
/sbin/busybox cat /dev/null > /data/log/dumpstate_app_error.txt.gz.tmp
/sbin/busybox cat /dev/null > /data/log/dumpstate_app_native.txt.gz.tmp
/sbin/busybox cat /dev/null > /data/log/dumpstate_sys_watchdog.txt.gz.tmp
/sbin/busybox cat /dev/null > /data/log/dumpstate_app_anr.txt.gz.tmp
/sbin/busybox cat /dev/null > /data/log/dumpstate_app_error.txt.gz
 
# Change permissions to read-only for key dumpstate files
/sbin/busybox chmod 400 /data/log/dumpstate_app_error.txt.gz.tmp
/sbin/busybox chmod 400 /data/log/dumpstate_app_native.txt.gz.tmp
/sbin/busybox chmod 400 /data/log/dumpstate_sys_watchdog.txt.gz.tmp
/sbin/busybox chmod 400 /data/log/dumpstate_app_anr.txt.gz.tmp
/sbin/busybox chmod 400 /data/log/dumpstate_app_error.txt.gz

# battery tweaks (sleepers)
/sbin/busybox mount -t debugfs none /sys/kernel/debug
echo NO_NEW_FAIR_SLEEPERS > /sys/kernel/debug/sched_features
echo NO_NORMALIZED_SLEEPERS > /sys/kernel/debug/sched_features
/sbin/busybox umount /sys/kernel/debug
