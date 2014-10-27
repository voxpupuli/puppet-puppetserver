class puppetserver(
  $version = 'present',
  $enable  = true,
  $start   = true,

  $config = {},
) {
  class { 'puppetserver::install': } ->
  class { 'puppetserver::config': } ~>
  class { 'puppetserver::service': } ->
  Class['puppetserver']
}
