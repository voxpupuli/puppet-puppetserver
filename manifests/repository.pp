class puppetserver::repository {
  case $::osfamily {
    Debian: {
      include ::apt
      apt::source { 'puppetlabs':
        location   => 'http://apt.puppetlabs.com',
        repos      => 'main',
        key        => '4BD6EC30',
        key_server => 'pgp.mit.edu',
      }
    }
    RedHat: {
      yumrepo { 'puppetlabs':
        descr    => "Puppet Labs Products El ${::operatingsystemmajrelease} - \$basearch",
        baseurl  => "http://yum.puppetlabs.com/el/${::operatingsystemmajrelease}/products/\$basearch",
        gpgcheck => '0',
        enabled  => '1',
      }
    }
    default: {
      fail "Unsupported Operating System family: ${::osfamily}"
    }
  }
}
