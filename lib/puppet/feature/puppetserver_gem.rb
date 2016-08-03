require 'puppet/util/feature'

Puppet.features.add(:puppetserver_gem) do
   File.executable?("/usr/bin/puppetserver")
end

## See https://tickets.puppetlabs.com/browse/PUP-5985
Puppet.features.send :meta_def, 'puppetserver_gem?' do
   name = :puppetserver_gem
   final = @results[name]
   @results[name] = File.executable?("/usr/bin/puppetserver") unless final
   @results[name]
end

