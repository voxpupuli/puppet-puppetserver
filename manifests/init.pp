class puppetserver(
  $version = 'present',
  $enable  = true,
  $start   = true,

  $config = {},
) {
  anchor { 'puppetserver::begin': } ->
  class { '::puppetserver::install': } ->
  class { '::puppetserver::config': } ~>
  class { '::puppetserver::service': } ->
  anchor { 'puppetserver::end': }
}
