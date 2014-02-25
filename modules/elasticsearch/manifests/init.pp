class elasticsearch {
	exec { 'install jdk':
	  path => "/usr/bin",
	  command => 'sudo yum install java-1.7.0-openjdk-devel -y',
	  timeout => 1250,
	}
	->
	# Install ElasticSearch Repo
	file { '/etc/yum.repos.d/elasticsearch-1.0.repo':
	  ensure => file,
	  owner  => 'root',
	  group  => 'root',
	  mode   => '0644',
	  source => 'puppet:///modules/elasticsearch/elasticsearch-1.0.repo',
	}
	->
	# Install ElasticSearch
	exec { 'install elasticsearch':
	  path => "/usr/bin",
	  command => 'sudo yum install elasticsearch -y',
	}
	->
    service { 'elasticsearch':
        ensure => 'running'
    }
    ->
	exec {
	    'start elasticsearch on load':
	        command     => 'sudo chkconfig elasticsearch on',
	        logoutput   => on_failure,
	        path   		=> "/usr/bin",
	}
}