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
      setting => 'webserver.conf/webserver/port',
      type    => 'puppetserver',
      ;

    'webserver/ssl-port':
      setting => 'webserver.conf/webserver/ssl-port',
      type    => 'puppetserver',
      ;

    'puppetserver/admin-api-cert':
      setting      => 'puppetserver.conf/puppet-admin/client-whitelist',
      setting_type => 'array',
      type         => 'puppetserver',
      ;
  }
}
