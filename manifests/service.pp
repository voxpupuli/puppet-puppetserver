class puppetserver::service {
  if $::puppetserver::manage_service {
    $ensure = $::puppetserver::start ? {
      true    => running,
      default => stopped,
    }

    service { $::puppetserver::service:
      ensure => $ensure,
      enable => $::puppetserver::enable,
    }
  }
}
