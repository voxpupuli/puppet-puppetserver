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
 
## Contributing

Please report bugs and feature request using [GitHub issue
tracker](https://github.com/camptocamp/puppet-puppetserver/issues).

For pull requests, it is very much appreciated to check your Puppet manifest
with [puppet-lint](http://puppet-lint.com/) to follow the recommended Puppet style guidelines from the
[Puppet Labs style guide](http://docs.puppetlabs.com/guides/style_guide.html).
 
## License

Copyright (c) 2014 <mailto:puppet@camptocamp.com> All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
