class puppetserver::hiera::eyaml (
  $method = 'pkcs7',
) {
  Package {
    ensure   => present,
    provider => puppetserver_gem,
    notify   => Class['puppetserver::service'],
  }

  case $method {
    'pkcs7': {
      package { 'hiera-eyaml': }
    }

    'gpg': {
      package { 'ruby_gpg':
        install_options => '-v ">= 0.3.1"',
      } ->
      package { 'hiera-eyaml-gpg':
        install_options => '-v ">= 0.5.rc1" --pre',
      }
    }

    default: {
      fail "Unknown method '${method}'."
    }
  }
}
