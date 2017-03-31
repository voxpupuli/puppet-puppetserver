class puppetserver (
  $version        = 'present',
  $enable         = true,
  $start          = true,
  $package        = 'puppetserver',
  $service        = 'puppetserver',
  $manage_service = true,
  $config         = {},
) {
  anchor { 'puppetserver::begin': }
  -> class { '::puppetserver::install': }
  -> class { '::puppetserver::config': }
  ~> class { '::puppetserver::service': }
  -> anchor { 'puppetserver::end': }
}
