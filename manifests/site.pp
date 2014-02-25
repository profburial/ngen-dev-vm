## 
# Prepare OS
##

# Dependencies
class {'update': } ->
class {'remi': } ->
class {'nginx': } ->
class {'php': } ->
class {'mariadb': } ->
class {'elasticsearch': } ->

# motd and ports
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

# open ports
class{'iptables': }