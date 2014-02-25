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
  timeout => 1800,
} ->

# open ports
class{'iptables': }