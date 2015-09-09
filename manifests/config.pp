class puppetserver::config {
  ::puppetserver::config::helper {
    'java_args/xms':
      setting => '-Xms',
      type    => 'java_arg',
      ;

    'java_args/xmx':
      setting => '-Xmx',
      type    => 'java_arg',
      ;

    'java_args/maxpermsize':
      setting => '-XX:MaxPermSize=',
      type    => 'java_arg',
      ;

    'webserver/port':
      setting => 'webserver.conf/@hash[.="webserver"]/@simple[.="port"]',
      type    => 'puppetserver',
      ;

    'webserver/ssl-port':
      setting => 'webserver.conf/@hash[.="webserver"]/@simple[.="ssl-port"]',
      type    => 'puppetserver',
      ;

    'puppetserver/admin-api-cert':
      setting => 'puppetserver.conf/@hash[.="puppet-admin"]/@array[.="client-whitelist"]/1',
      type    => 'puppetserver',
      ;
  }
}
