define puppetserver::config::bootstrap (
  $ensure = 'present',
  Optional[Stdlib::Absolutepath] $targetfile = undef,
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

  # puppetserver >= 2.5 changed the path to the bootstrap configuration file [1] [2] [3].
  # $::puppetversion is the version of the Puppet agent on the client and can
  # not reliable distinguish the puppetserver version running on the master.
  # For puppetserver 2.5 and above you need to set the targetfile to:
  # '/etc/puppetlabs/puppetserver/services.d/ca.cfg'
  #
  # [1] https://github.com/voxpupuli/puppet-puppetserver/issues/52
  # [2] https://puppet.com/docs/puppetserver/2.7/release_notes.html#potential-breaking-issues-when-upgrading-with-a-modified-bootstrapcfg
  # [3] https://puppet.com/docs/puppetserver/2.7/release_notes.html#new-feature-flexible-service-bootstrappingca-configuration-file
  if $targetfile {
    $targetfile_real = $targetfile
  } else {
    if versioncmp($::puppetversion, '4.0.0') >= 0 {
      $targetfile_real = '/etc/puppetlabs/puppetserver/bootstrap.cfg'
    } else {
      $targetfile_real = '/etc/puppetserver/bootstrap.cfg'
    }
  }

  augeas { "Set puppetserver bootstrap ${title}":
    lens    => 'Simplelines.lns',
    incl    => $targetfile_real,
    changes => $changes,
    onlyif  => $onlyif,
  }
}
