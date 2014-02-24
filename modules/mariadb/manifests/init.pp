class mariadb {
	file { '/etc/yum.repos.d/MariaDB.repo':
	  owner  => 'root',
	  group  => 'root',
	  mode   => '0644',
	  source => 'puppet:///modules/mariadb/MariaDB.repo',
	}
	->
	exec { 'install MariaDB':
	  path => "/usr/bin",
	  command => 'sudo yum install MariaDB-server MariaDB-client -y',
	  timeout => 750,
	}
	->
    service { 'mysql':
        ensure => 'running'
    }
}