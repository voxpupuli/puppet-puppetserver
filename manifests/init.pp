class puppetserver(
  $version = 'present',
  $enable  = true,
  $start   = true,

  $config = {
    'java_args'     => {
      'xms'         => '2g',
      'xmx'         => '2g',
      'maxpermsize' => '256m',
    },
  },
) {
  class { 'puppetserver::install': } ->
  class { 'puppetserver::config': } ~>
  class { 'puppetserver::service': } ->
  Class['puppetserver']
}
