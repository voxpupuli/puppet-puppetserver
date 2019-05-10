class puppetserver::repository (
  $yum_proxy            = undef,
  $yum_proxy_username   = undef,
  $yum_proxy_password   = undef,
  $yum_deps_baseurl     = undef,
  $yum_products_baseurl = undef,
  ){


  if $yum_deps_baseurl {
    $yum_real_deps_baseurl = $yum_deps_baseurl
  }
  else {
    $yum_real_deps_baseurl = "http://yum.puppetlabs.com/el/${::operatingsystemmajrelease}/dependencies/\$basearch"
  }

  if $yum_products_baseurl {
    $yum_real_products_baseurl = $yum_products_baseurl
  }
  else {
    $yum_real_products_baseurl = "http://yum.puppetlabs.com/el/${::operatingsystemmajrelease}/products/\$basearch"
  }

  case $::osfamily {
    'Debian': {
      include ::apt
      apt::source { 'puppetlabs':
        location => 'http://apt.puppetlabs.com',
        repos    => 'main',
        key      => {
            id     => '47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30',
            server => 'pool.sks-keyservers.net',
        },
      }
    }
    'RedHat': {
      yumrepo { 'puppetlabs-deps':
        descr          => "Puppet Labs Dependencies El ${::operatingsystemmajrelease} - \$basearch",
        baseurl        => $yum_real_deps_baseurl,
        gpgcheck       => '1',
        gpgkey         => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
        enabled        => '1',
        proxy          => $yum_proxy,
        proxy_username => $yum_proxy_username,
        proxy_password => $yum_proxy_password,
      }
      yumrepo { 'puppetlabs-products':
        descr          => "Puppet Labs Products El ${::operatingsystemmajrelease} - \$basearch",
        baseurl        => $yum_real_products_baseurl,
        gpgcheck       => '1',
        gpgkey         => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
        enabled        => '1',
        proxy          => $yum_proxy,
        proxy_username => $yum_proxy_username,
        proxy_password => $yum_proxy_password,
      }
    }
    default: {
      fail "Unsupported Operating System family: ${::osfamily}"
    }
  }
}
