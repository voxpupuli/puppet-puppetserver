class puppetserver::repository (
  $use_collections     = false,
  $collections_version = 1,
)
{
  case $::osfamily {
    'Debian': {
      include ::apt
      apt::source { 'puppetlabs':
        location   => 'http://apt.puppetlabs.com',
        repos      => 'main',
        key        => '4BD6EC30',
        key_server => 'pgp.mit.edu',
      }
    }
    'RedHat': {
      if $use_collections {
        yumrepo { "puppetlabs-PC1":
            descr    => "Puppet Labs Collections El ${::operatingsystemmajrelease} - \$basearch",
            baseurl  => "http://yum.puppetlabs.com/el/${::operatingsystemmajrelease}/PC${collections_version}/\$basearch",
            gpgcheck => '1',
            gpgkey   => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
            enabled  => '1',
        }
      } else {
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
    }
    default: {
      fail "Unsupported Operating System family: ${::osfamily}"
    }
  }
}
