Puppet::Type.type(:package).provide :puppetserver_gem, :parent => :gem do
  desc "Puppet Server Ruby Gem support. If a URL is passed via `source`, then
    that URL is used as the remote gem repository; if a source is present but is
    not a valid URL, it will be interpreted as the path to a local gem file.  If
    source is not present at all, the gem will be installed from the default gem
    repositories."
 
  has_feature :versionable, :install_options
  # We're patching self.command, so we need to confine manually
  confine :exists => which('puppetserver'), :for_binary => true
 
  def self.command(name)
    return [which('puppetserver'), 'gem'] if name == :gemcmd
    super
  end
end
