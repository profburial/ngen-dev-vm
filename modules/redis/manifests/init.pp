class redis { 
    exec { 'install redis':
      path => "/usr/bin",
      command => 'sudo yum install redis -y',
      timeout => 750,
    }
    ->
    service { 'redis':
        ensure => 'running'
    }
    ->
    exec {
        'start redis on load':
            command     => 'sudo chkconfig redis on',
            logoutput   => on_failure,
            path        => "/usr/bin",
    }
}