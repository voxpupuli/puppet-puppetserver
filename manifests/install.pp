class puppetserver::install {
  package { 'puppetserver':
    ensure => $::puppetserver::version,
  }
}
