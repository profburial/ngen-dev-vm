class php {
	exec { 'yum install wget':
	  path => "/usr/bin",
	  command => 'sudo yum install wget -y',
	  timeout => 750,
	}
	~>
	exec { 'get remi':
	  path => "/usr/bin",
	  cwd => '/home/vagrant',
	  command => 'wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm',
	}
	~>
	exec { 'get epel':
	  path => "/usr/bin",
	  cwd => '/home/vagrant',
	  command => 'wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm',
	}
	~>
	exec { 'install epel':
	  path => "/usr/bin",
	  cwd => '/home/vagrant',
	  command => 'sudo rpm -Uvh epel-release-6*.rpm',
	  logoutput => false,
	}
	~>
	exec { 'install remi':
	  path => "/usr/bin",
	  cwd => '/home/vagrant',
	  command => 'sudo rpm -Uvh remi-release-6*.rpm',
	  logoutput => false,
	}
	file { '/etc/yum.repos.d/remi.repo':
	  ensure => file,
	  owner  => 'root',
	  group  => 'root',
	  mode   => '0644',
	  source => 'puppet:///modules/php/remi.repo',
	}
	~>
	exec { 'install php':
	  path => "/usr/bin",
	  cwd => '/home/vagrant',
	  command => 'sudo yum install -y php php-opcache php-mcrypt php-mbstring php-mysql php-xml php-json php-api php-gd php-fpm',
	  timeout => 750,
	}
	~>
	exec { 'config php':
	  provider => shell,
	  command => 'echo "cgi.fix_pathinfo=0" >> "/etc/php.ini"',
	}
	~>
	file { '/etc/php-fpm.d/www.conf':
	  ensure => file,
	  owner  => 'root',
	  group  => 'root',
	  mode   => '0644',
	  source => 'puppet:///modules/php/www.conf',
	}
	~>
    exec { 'start php-fpm':
	  path => "/usr/bin",
	  cwd => '/home/vagrant',
	  command => 'sudo service php-fpm start',
	}
}