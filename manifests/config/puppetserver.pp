define puppetserver::config::puppetserver (
  $value,
  $ensure = 'present',
) {
  require ::puppetserver::augeas

  $targetdir = '/etc/puppetserver/conf.d'
  $target = "${targetdir}${file}"

  case $ensure {
    'present': {
      $changes = [
        "set /files${targetdir}/${name} '${value}'",
      ]
    }

    'absent': {
      $changes = [
        "rm /files${targetdir}/${name}",
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
