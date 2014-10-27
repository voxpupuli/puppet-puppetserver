class puppetserver::config {
  if has_key($::puppetserver::config, 'java_args') {
    if has_key($::puppetserver::config['java_args'], 'xms') {
      ::puppetserver::config::java_arg {
        '-Xms':
          ensure => 'present',
          value  => $::puppetserver::config['java_args']['Xms'],
      }
    }

    if has_key($::puppetserver::config['java_args'], 'xmx') {
      ::puppetserver::config::java_arg {
        '-Xmx':
          ensure => 'present',
          value  => $::puppetserver::config['java_args']['Xmx'],
      }
    }

    if has_key($::puppetserver::config['java_args'], 'maxpermsize') {
      ::puppetserver::config::java_arg {
        '-XX:MaxPermSize=':
          ensure => 'present',
          value  => $::puppetserver::config['java_args']['MaxPermsize'],
      }
    }
  }
}
