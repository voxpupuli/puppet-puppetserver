define puppetserver::config::puppetserver (
  $value,
  $ensure = 'present',
  $setting_type = undef,
) {
  require ::puppetserver::augeas

  if versioncmp($::puppetversion, '4.0.0') >= 0 {
    $targetdir = '/etc/puppetlabs/puppetserver/conf.d'
  } else {
    $targetdir = '/etc/puppetserver/conf.d'
  }
  $key = "${targetdir}/${title}"

  puppetserver_config { $key:
    ensure => $ensure,
    value  => $value,
    type   => $setting_type,
  }
}
