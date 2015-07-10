define puppetserver::config::bootstrap (
  $ensure = 'present',
  # For compat with other config types, unused
  $value = undef,
) {
  case $ensure {
    'present': {
      $changes = "set ./01 '${name}'"
      $onlyif = "match ./*[label()!='#comment' and .='${name}'] size == 0"
    }

    'absent': {
      $changes = "rm ./*[label()!='#comment' and .='${name}']"
      $onlyif = "match ./*[label()!='#comment' and .='${name}'] size != 0"
    }

    default: {
      fail 'Wrong value for "ensure".'
    }
  }

  if versioncmp($::puppetversion, '4.0.0') >= 0 {
    $targetfile = '/etc/puppetlabs/puppetserver/bootstrap.cfg'
  } else {
    $targetfile = '/etc/puppetserver/bootstrap.cfg'
  }

  augeas { "Set puppetserver bootstrap ${title}":
    lens    => 'Simplelines.lns',
    incl    => "${targetfile}",
    changes => $changes,
    onlyif  => $onlyif,
  }
}
