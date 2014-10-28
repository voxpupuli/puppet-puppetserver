define puppetserver::config::puppetserver (
  $value,
  $ensure = 'present',
) {
  require ::puppetserver::augeas

  $targetdir = '/etc/puppetserver/conf.d'
  $target = "/files${targetdir}/${name}"

  case $ensure {
    'present': {
      $changes = [
        "set ${target} '${value}'",
      ]
    }

    'absent': {
      $changes = [
        "rm ${target}",
      ]
    }

    default: {
      fail 'Wrong value for "ensure".'
    }
  }

  augeas { "Set puppetserver config ${title}":
    lens    => 'Trapperkeeper.lns',
    incl    => "${targetdir}/*",
    changes => $changes,
  }
}
