class puppetserver::config {
  $target = $::osfamily ? {
    Debian => '/etc/default/puppetserver',
    RedHat => '/etc/sysconfig/puppetserver',
  }

  shellvar { 'JAVA_ARGS':
    ensure   => present,
    target   => $target,
    variable => 'JAVA_ARGS',
    value    => "-Xms${::puppetserver::java_xms} -Xmx${::puppetserver::java_xmx} -XX:MaxPermSize=256m"
  }
}
