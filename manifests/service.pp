class puppetserver::service {
  $ensure = $::puppetserver::start ? {
    true    => running,
    default => stopped,
  }
  service { 'puppetserver':
    ensure => $ensure,
    enable => $::puppetserver::enable,
  }
}
