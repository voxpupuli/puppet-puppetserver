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

  augeas { "Set puppetserver bootstrap ${title}":
    lens    => 'Simplelines.lns',
    incl    => '/etc/puppetserver/bootstrap.cfg',
    changes => $changes,
    onlyif  => $onlyif,
  }
}
