class iptables {

	# exec { 'open port 80':
	#   path => "/usr/bin",
	#   command => 'sudo iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT',
	# }

	# exec { 'open port 443':
	#   path => "/usr/bin",
	#   command => 'sudo iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT',
	# }

	exec { 'stop iptables':
	  path => "/usr/bin",
	  command => 'sudo service iptables stop',
	}
	->
	exec { 'stop iptables reboot':
	  path => "/usr/bin",
	  command => 'sudo chkconfig iptables off',
	}
}
