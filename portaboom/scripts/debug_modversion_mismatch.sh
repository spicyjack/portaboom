#!/bin/sh


/bin/busybox echo "DEBUGGING OUTPUT BEGINS"
/bin/busybox find /lib/modules/2.6.36.2-lack
/bin/busybox uname -a
/bin/busybox ls -l /lib/modules/2.6.36.2-lack/kernel/net/unix/unix.ko
/bin/busybox echo "DEBUGGING OUTPUT ENDS"

