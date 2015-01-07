define puppetserver::config::java_arg (
  $value,
  $ensure = 'present',
) {
  Class['puppetserver::install'] ->
  Puppetserver::Config::Java_arg[$title] ~>
  Class['puppetserver::service']
  
  case $ensure {
    'present': {
      $changes = [
        'set JAVA_ARGS/quote \'"\'',
        "set JAVA_ARGS/value[.=~regexp('${name}.*')] '${name}${value}'",
      ]
    }

    'absent': {
      $changes = [
        "rm JAVA_ARGS/value[.=~regexp('${name}.*')]",
        'rm JAVA_ARGS[count(value)=0]',
      ]
    }

    default: {
      fail 'Wrong value for "ensure".'
    }
  }

  $target = $::osfamily ? {
    'Debian' => '/etc/default/puppetserver',
    'RedHat' => '/etc/sysconfig/puppetserver',
  }

  augeas { "Set puppetserver java_arg ${title}":
    lens    => 'Shellvars_list.lns',
    incl    => $target,
    changes => $changes,
  }
}
