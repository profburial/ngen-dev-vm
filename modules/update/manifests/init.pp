class update {
	exec { 'yum update':
	  path => "/usr/bin",
	  command => 'sudo yum update -y',
	  timeout => 1800,
	}
}