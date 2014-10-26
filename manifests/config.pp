class puppetserver::config {
  case $::osfamily {
    Debian: {
      shellvar { 'JAVA_ARGS':
        ensure   => present,
        target   => '/etc/default/puppetserver',
        variable => 'JAVA_ARGS',
        value    => "-Xms${::puppetserver::java_xms} -Xmx${::puppetserver::java_xmx} -XX:MaxPermSize=256m"
      }
    }
    RedHat: {
    }
    default: {
      fail "Unsupported Operating System family: ${::osfamily}"
    }
  }
}
