module Test_Trapperkeeper =

(* Variable: config *)
let config = "
  # This is a comment
  webserver: {
    bar: {
        # A comment
        host:           localhost
        port=           9000
        default-server: true
    }

    foo: {
        host: localhost
        port = 10000
    }
}

jruby-puppet: {
    # This setting determines where JRuby will look for gems.  It is also
    # used by the `puppetserver gem` command line tool.
    gem-home: /var/lib/puppet/jruby-gems

    # (optional) path to puppet conf dir; if not specified, will use the puppet default
    master-conf-dir: /etc/puppet

    # (optional) path to puppet var dir; if not specified, will use the puppet default
    master-var-dir: /var/lib/puppet

    # (optional) maximum number of JRuby instances to allow; defaults to <num-cpus>+2
    #max-active-instances: 1
}


# CA-related settings
certificate-authority: {

    # settings for the certificate_status HTTP endpoint
    certificate-status: {

        # this setting contains a list of client certnames who are whitelisted to
        # have access to the certificate_status endpoint.  Any requests made to
        # this endpoint that do not present a valid client cert mentioned in
        # this list will be denied access.
        client-whitelist: []
    }
}

os-settings: {
    ruby-load-path: [/usr/lib/ruby/vendor_ruby, /home/foo/ruby ]
}
\n"

(* Test: Trapperkeeper.lns
     Test full config file *)
test Trapperkeeper.lns get config =
  {  }
  { "#comment" = "This is a comment" }
  { "webserver"
    { "bar"
      { "#comment" = "A comment" }
      { "host" = "localhost" }
      { "port" = "9000" }
      { "default-server" = "true" }
    }
    {  }
    { "foo"
      { "host" = "localhost" }
      { "port" = "10000" }
    }
  }
  {  }
  { "jruby-puppet"
    { "#comment" = "This setting determines where JRuby will look for gems.  It is also" }
    { "#comment" = "used by the `puppetserver gem` command line tool." }
    { "gem-home" = "/var/lib/puppet/jruby-gems" }
    {  }
    { "#comment" = "(optional) path to puppet conf dir; if not specified, will use the puppet default" }
    { "master-conf-dir" = "/etc/puppet" }
    {  }
    { "#comment" = "(optional) path to puppet var dir; if not specified, will use the puppet default" }
    { "master-var-dir" = "/var/lib/puppet" }
    {  }
    { "#comment" = "(optional) maximum number of JRuby instances to allow; defaults to <num-cpus>+2" }
    { "#comment" = "max-active-instances: 1" }
  }
  {  }
  {  }
  { "#comment" = "CA-related settings" }
  { "certificate-authority"
    { "#comment" = "settings for the certificate_status HTTP endpoint" }
    { "certificate-status"
      { "#comment" = "this setting contains a list of client certnames who are whitelisted to" }
      { "#comment" = "have access to the certificate_status endpoint.  Any requests made to" }
      { "#comment" = "this endpoint that do not present a valid client cert mentioned in" }
      { "#comment" = "this list will be denied access." }
      { "client-whitelist" }
    }
  }
  {  }
  { "os-settings"
    { "ruby-load-path"
      { "1" = "/usr/lib/ruby/vendor_ruby" }
      { "2" = "/home/foo/ruby" }
    }
  }
  {  }


(* Test: Trapperkeeper.lns
     Should parse an empty file *)
test Trapperkeeper.lns get "\n" = {}

(* Test: Trapperkeeper.lns
     Values can be quoted *)
test Trapperkeeper.lns get "os-settings: {
    ruby-load-paths: [\"/usr/lib/ruby/site_ruby/1.8\"]
}\n" =
  { "os-settings"
    { "ruby-load-paths"
      { "1" = "/usr/lib/ruby/site_ruby/1.8" }
    }
  }

