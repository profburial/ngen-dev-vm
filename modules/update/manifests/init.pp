class update {
	notify {"running yum update. this will take awhile...": }
	->
	exec { 'yum update':
	  path => "/usr/bin",
	  command => 'sudo yum update -y',
	  timeout => 1800,
	}
}