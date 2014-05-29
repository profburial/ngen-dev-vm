## 
# Prepare OS
##

# Dependencies
class {'remi': } ->
class {'nginx': } ->
class {'php': } ->
class {'mariadb': } ->
class {'elasticsearch': } ->
class {'redis': } -> 
class {'beanstalkd': } ->

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
} ->

# rebuild guest additions
exec { 'rebuild guest additions':
  path => "/usr/bin",
  command => 'sudo /etc/init.d/vboxadd setup',
  timeout => 750,
} ->

# open ports
class{'iptables': }