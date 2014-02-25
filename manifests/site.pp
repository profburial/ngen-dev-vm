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
->
exec { 'open port 80':
  path => "/usr/bin",
  command => 'sudo iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT',
}
->
exec { 'open port 443':
  path => "/usr/bin",
  command => 'sudo iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT',
}