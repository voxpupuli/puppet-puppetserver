class puppetserver(
  $version = 'present',
  $enable  = true,
  $start   = true,
  $package = 'puppetserver',
  $config = {},
) {
  anchor { 'puppetserver::begin': } ->
  class { '::puppetserver::install': } ->
  class { '::puppetserver::config': } ~>
  class { '::puppetserver::service': } ->
  anchor { 'puppetserver::end': }
}
