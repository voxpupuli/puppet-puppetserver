class puppetserver(
  $version = 'present',
  $enable  = true,
  $start   = true,

  $config = {},
) {
  if $::memorysize_mb < 2048 {
    fail 'Puppetserver needs at least 2GB of memory to start'
  }
  anchor { 'puppetserver::begin': } ->
  class { '::puppetserver::install': } ->
  class { '::puppetserver::config': } ~>
  class { '::puppetserver::service': } ->
  anchor { 'puppetserver::end': }
}
