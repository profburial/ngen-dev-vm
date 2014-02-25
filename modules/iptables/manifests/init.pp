class iptables {
	exec { 'open port 80':
	  path => "/usr/bin",
	  command => 'sudo iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT',
	}

	exec { 'open port 443':
	  path => "/usr/bin",
	  command => 'sudo iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT',
	}
}
