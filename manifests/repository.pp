class puppetserver::repository {
  case $::osfamily {
    'Debian': {
      include ::apt
      apt::source { 'puppetlabs':
        location   => 'http://apt.puppetlabs.com',
        repos      => 'main',
        key        => '47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30',
        key_server => 'hkp://pgp.mit.edu:80',
      }
    }
    'RedHat': {
      yumrepo { 'puppetlabs-deps':
        descr    => "Puppet Labs Dependencies El ${::operatingsystemmajrelease} - \$basearch",
        baseurl  => "http://yum.puppetlabs.com/el/${::operatingsystemmajrelease}/dependencies/\$basearch",
        gpgcheck => '1',
        gpgkey   => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
        enabled  => '1',
      }
      yumrepo { 'puppetlabs-products':
        descr    => "Puppet Labs Products El ${::operatingsystemmajrelease} - \$basearch",
        baseurl  => "http://yum.puppetlabs.com/el/${::operatingsystemmajrelease}/products/\$basearch",
        gpgcheck => '1',
        gpgkey   => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
        enabled  => '1',
      }
    }
    default: {
      fail "Unsupported Operating System family: ${::osfamily}"
    }
  }
}
