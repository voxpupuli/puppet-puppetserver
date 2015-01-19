class puppetserver(
  $version = 'present',
  $enable  = true,
  $start   = true,

  $config = {},
) {
  if $::memorysize_mb < 2048 {
    fail 'Puppetserver needs at least 2GB of memory to start'
  }
  class { '::puppetserver::install': } ->
  class { '::puppetserver::config': } ~>
  class { '::puppetserver::service': } ->
  Class['puppetserver']
}
