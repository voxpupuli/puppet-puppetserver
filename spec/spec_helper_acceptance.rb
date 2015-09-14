require 'beaker-rspec'

hosts.each do |host|
  # Install Puppet
  if ENV['PUPPET_AIO']
    install_puppet_agent_on host, {}
  else
    install_puppet_on host
  end
end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    puppet_module_install(:source => proj_root, :module_name => 'puppetserver')

    hosts.each do |host|
      on host, puppet('module','install','puppetlabs-apt'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module','install','puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module','install','herculesteam-augeasproviders_core'), { :acceptable_exit_codes => [0,1] }
    end

    pp = <<-EOS
      class { 'puppetserver::repository': }
    EOS

    apply_manifest_on(hosts, pp, :catch_failures => false)
  end
end
