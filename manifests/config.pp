class puppetserver::config {
  ::puppetserver::config::java_arg {
    '-Xms':
      ensure => 'present',
      value  => $::puppetserver::java_xms,
      ;

    '-Xmx':
      ensure => 'present',
      value  => $::puppetserver::java_xmx,
      ;

    '-XX:MaxPermSize=':
      ensure => 'present',
      value  => '256m',
      ;
  }
}
