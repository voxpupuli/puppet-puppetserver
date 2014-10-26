class puppetserver(
  $version = 'present',
  $enable  = true,
  $start   = true,

  $java_xms = '2g',
  $java_xmx = '2g',
) {
  class { 'puppetserver::install': } ->
  class { 'puppetserver::config': } ~>
  class { 'puppetserver::service': } ->
  Class['puppetserver']
}
