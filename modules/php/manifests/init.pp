class php {
	exec { 'install php':
	  path => "/usr/bin",
	  cwd => '/home/vagrant',
	  command => 'sudo yum install php php-opcache php-mcrypt php-mbstring php-mysql php-xml php-json php-api php-gd php-fpm -y',
	  timeout => 1250,
	}
	->
	exec { 'config php':
	  provider => shell,
	  command => 'echo "cgi.fix_pathinfo=0" >> "/etc/php.ini"',
	}
	->
	file { '/etc/php-fpm.d/www.conf':
	  ensure => file,
	  owner  => 'root',
	  group  => 'root',
	  mode   => '0644',
	  source => 'puppet:///modules/php/www.conf',
	}
	->
    exec { 'start php-fpm':
	  path => "/usr/bin",
	  cwd => '/home/vagrant',
	  command => 'sudo service php-fpm start',
	}
	->
	->
	exec { 'start php-fpm reboot':
	  path => "/usr/bin",
	  command => 'sudo chkconfig php-fpm on',
	}
}