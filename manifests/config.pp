class puppetserver::config {
  if has_key($::puppetserver::config, 'java_args') {
    if has_key($::puppetserver::config['java_args'], 'xms') {
      ::puppetserver::config::java_arg { '-Xms':
        ensure => 'present',
        value  => $::puppetserver::config['java_args']['xms'],
      }
    }

    if has_key($::puppetserver::config['java_args'], 'xmx') {
      ::puppetserver::config::java_arg { '-Xmx':
        ensure => 'present',
        value  => $::puppetserver::config['java_args']['xmx'],
      }
    }

    if has_key($::puppetserver::config['java_args'], 'maxpermsize') {
      ::puppetserver::config::java_arg { '-XX:MaxPermSize=':
        ensure => 'present',
        value  => $::puppetserver::config['java_args']['maxpermsize'],
      }
    }
  }

  if has_key($puppetserver::config, 'webserver') {
    if has_key($puppetserver::config['webserver'], 'port') {
      ::puppetserver::config::puppetserver { 'webserver.conf/port':
        ensure => 'present',
        value  => $puppetserver::config['webserver']['port'],
      }
    }
  }
}
