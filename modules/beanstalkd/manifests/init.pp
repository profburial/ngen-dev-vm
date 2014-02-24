class beanstalkd {
	exec { 'install beanstalkd':
	  path => "/usr/bin",
	  command => 'sudo yum install beanstalkd -y',
	  timeout => 750,
	}
	~>
	service{ 'beanstalkd':
	  ensure => 'running'
	}
}