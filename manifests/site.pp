
## 
# Prepare OS
##

# Dependencies
include php
include nginx
include mariadb
include elasticsearch

# motd
file { '/etc/motd':
   content => "Welcome to nGen Dev, running $operatingsystem version $operatingsystemrelease and managed by puppet.
     System Details
     --------------------------------------
     IP Address: $ipaddress
     Uptime: $uptime
     Memory: $memorysize
     Kernel: $kernelrelease
     --------------------------------------
     \n"
}