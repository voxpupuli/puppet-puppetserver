class puppetserver::hiera::eyaml (
  $method          = 'pkcs7',
  $install_options = undef,
) {
  Package {
    ensure          => present,
    provider        => puppetserver_gem,
    install_options => $install_options,
    notify          => Class['puppetserver::service'],
  }

  case $method {
    'pkcs7': {
      package { 'hiera-eyaml': }
    }

    'gpg': {
      package { 'ruby_gpg': }
      -> package { 'hiera-eyaml-gpg': }
    }

    default: {
      fail "Unknown method '${method}'."
    }
  }
}
