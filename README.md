### This module is deprecated in favor of [theforman/puppet-puppet](https://github.com/theforeman/puppet-puppet) ([#69](https://github.com/voxpupuli/puppet-puppetserver/issues/69))

---

# Puppetserver

[![Puppet Forge Version](http://img.shields.io/puppetforge/v/camptocamp/puppetserver.svg)](https://forge.puppetlabs.com/camptocamp/puppetserver)
[![Puppet Forge Downloads](http://img.shields.io/puppetforge/dt/camptocamp/puppetserver.svg)](https://forge.puppetlabs.com/camptocamp/puppetserver)
[![Build Status](https://img.shields.io/travis/camptocamp/puppet-puppetserver/master.svg)](https://travis-ci.org/camptocamp/puppet-puppetserver)
[![Puppet Forge Endorsement](https://img.shields.io/puppetforge/e/camptocamp/puppetserver.svg)](https://forge.puppetlabs.com/camptocamp/puppetserver)
[![Gemnasium](https://img.shields.io/gemnasium/camptocamp/puppet-puppetserver.svg)](https://gemnasium.com/camptocamp/puppet-puppetserver)
[![Donated by Camptocamp](https://img.shields.io/badge/by-camptocamp-fb7047.svg)](http://www.camptocamp.com)

## Overview

The puppetserver module allows you to easily manage Puppetserver with Puppet.

## Usage

### Simple usage

```puppet
class { 'puppetserver::repository': } ->
class { 'puppetserver': }
```

### Tuning configuration parameters

```puppet
class { 'puppetserver::repository': } ->
class { 'puppetserver':
  config => {
    'java_args'     => {
      'xms'         => '4g',
      'xmx'         => '6g',
      'maxpermsize' => '512m',
      'tmpdir'      => '/tmp',
    },

    'webserver'  => {
      'ssl-port' => '18140',
    },
  },
}
```

## Classes

### puppetserver

The main class to install a Puppet Server.

### puppetserver::hiera::eyaml

Install the necessary gems for hiera-eyaml inside the Puppet Server.

Simple usage:

```puppet
class { '::puppetserver::hiera::eyaml':
  require => Class['puppetserver::install'],
}
```

Specify eyaml method:

```puppet
class { '::puppetserver::hiera::eyaml':
  method  => 'gpg',
  require => Class['puppetserver::install'],
}
```


## Definitions

### puppetserver::config::java_arg

A setting stored in the `JAVA_ARGS` variable. Values are managed individually (you don't need to provide all of them);

Example:

```puppet
puppetserver::config::java_arg { '-Xms':
  value   => '4g',
}
```

Special note on the tmpdir java_arg. The puppet-server installation requires a tmp dir with a mode of 1777 and a tmp folder which is NOT mounted with the noexec parameter.
Otherwise the installation will fail with this strange error message:
```
Caused by: org.jruby.embed.EvalFailedException: (Error) Cannot determine basic system flavour
```
For more details, see [here](https://github.com/puppetlabs/puppetserver/blob/master/documentation/known_issues.markdown).

### puppetserver::config::puppetserver

A Puppetserver configuration entry.

Example:

```puppet
puppetserver::config::puppetserver { 'webserver.conf/webserver/ssl-port':
  value   => '18140',
}
```

### puppetserver::config::bootstrap

A Puppetserver bootstrap.cfg entry.

Example:

```puppet
puppetserver::config::bootstrap { 'puppetlabs.services.ca.certificate-authority-disabled-service/certificate-authority-disabled-service':
  ensure => present,
}
```

## Providers

### puppetserver_gem

This plugin allows to manage gems in the Puppetserver.

Example:

```puppet
gem { 'hiera-eyaml':
  ensure   => present,
  provider => puppetserver_gem,
}
```
 
## Contributing

Please report bugs and feature request using [GitHub issue
tracker](https://github.com/camptocamp/puppet-puppetserver/issues).

For pull requests, it is very much appreciated to check your Puppet manifest
with [puppet-lint](http://puppet-lint.com/) to follow the recommended Puppet style guidelines from the
[Puppet Labs style guide](http://docs.puppetlabs.com/guides/style_guide.html).
 

## Transfer Notice

This module was originally authored by [Camptocamp](http://www.camptocamp.com).
Camptocamp stopped using this module and preferred that Voxpupuli take ownership of the module for future improvement and maintenance.
Existing pull requests and issues were transferred over, please fork and continue to contribute here instead of Camptocamp.

Previously: https://github.com/camptocamp/puppet-puppetserver
