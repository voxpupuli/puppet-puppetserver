class puppetserver::install {
  package { 'puppetserver':
    ensure => $::puppetserver::version,
  } ->
  # puppetserver 1.0.2 Debian package does not properly set ownership
  file { '/var/lib/puppet/ssl':
    ensure  => directory,
    owner   => 'puppet',
    group   => 'puppet',
    recurse => true,
  }
}
