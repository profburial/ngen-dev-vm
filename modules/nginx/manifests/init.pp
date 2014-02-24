class nginx {
	file { '/etc/yum.repos.d/nginx.repo':
	  ensure => file,
	  owner  => 'root',
	  group  => 'root',
	  mode   => '0644',
	  source => 'puppet:///modules/nginx/nginx.repo',
	}
	->
	exec { 'install nginx':
	  path => "/usr/bin",
	  command => 'sudo yum install nginx -y',
	  timeout => 750,
	}
	->
	file { '/etc/nginx/conf.d/default.conf':
	  ensure => file,
	  owner  => 'root',
	  group  => 'root',
	  mode   => '0644',
	  source => 'puppet:///modules/nginx/nginx.conf',
	}
	->
    service { 'nginx':
        ensure => 'running'
    }
}