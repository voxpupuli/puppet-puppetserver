# Puppetserver

[![Puppet Forge](http://img.shields.io/puppetforge/v/camptocamp/puppetserver.svg)](https://forge.puppetlabs.com/camptocamp/puppetserver)
[![Build Status](https://travis-ci.org/camptocamp/puppet-puppetserver.png?branch=master)](https://travis-ci.org/camptocamp/puppet-puppetserver)

## Overview

The puppetserver module allows you to easily manage Puppetserver with Puppet.

## Usage

```puppet
class { 'puppetserver::repository': } ->
class { 'puppetserver': }
```

## Definitions

### puppetserver::config::entry

Sets up a configuration entry.

Examples:

```puppet
puppetserver::config::entry { 'Java Xms':
  setting => '-Xms',
  type    => 'java_arg',
  value   => '4g',
}

puppetserver::config::entry { 'SSL port':
  setting => 'webserver.conf/webserver/ssl-port',
  type    => 'puppetserver',
  value   => '18140',
}
```

It currently supports 2 types:

* `java_arg`: A setting stored in the `JAVA_ARGS` variable. Values are managed individually (you don't need to provide all of them);
* `puppetserver`: A setting in Puppetserver's conf.d.
