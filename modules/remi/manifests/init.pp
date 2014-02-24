class remi {
	exec { 'yum install wget':
	  path => "/usr/bin",
	  command => 'sudo yum install wget -y',
	  timeout => 750,
	}
	->
	exec { 'get remi':
	  path => "/usr/bin",
	  cwd => '/home/vagrant',
	  command => 'wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm',
	}
	->
	exec { 'get epel':
	  path => "/usr/bin",
	  cwd => '/home/vagrant',
	  command => 'wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm',
	}
	->
	exec { 'install epel':
	  path => "/usr/bin",
	  cwd => '/home/vagrant',
	  command => 'sudo rpm -ivh --replacepkgs epel-release-6-8.noarch.rpm',
	}
	->
	exec { 'install remi':
	  path => "/usr/bin",
	  cwd => '/home/vagrant',
	  command => 'sudo rpm -ivh --replacepkgs remi-release-6.rpm',
	}
	->
	file { '/etc/yum.repos.d/remi.repo':
	  ensure => file,
	  owner  => 'root',
	  group  => 'root',
	  mode   => '0644',
	  source => 'puppet:///modules/remi/remi.repo',
	}
}