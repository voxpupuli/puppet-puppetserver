# This file is managed via modulesync
# https://github.com/voxpupuli/modulesync
# https://github.com/voxpupuli/modulesync_config
require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'
include RspecPuppetFacts

# Setup augeasproviders
require 'pathname'
dir = Pathname.new(__FILE__).parent
$LOAD_PATH.unshift(dir, File.join(dir, 'fixtures/modules/augeasproviders_core/spec/lib'), File.join(dir, '..', 'lib'))
require 'augeas_spec'
require 'pathname'
dir = Pathname.new(__FILE__).parent
Puppet[:modulepath] = File.join(dir, 'fixtures', 'modules')
puts 'augeasproviders: setting Puppet[:libdir] to work around broken type autoloading'
# libdir is only a single dir, so it can only workaround loading of one external module
Puppet[:libdir] = "#{Puppet[:modulepath]}/augeasproviders_core/lib"

if Dir.exist?(File.expand_path('../../lib', __FILE__))
  require 'coveralls'
  require 'simplecov'
  require 'simplecov-console'
  SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::Console
  ]
  SimpleCov.start do
    track_files 'lib/**/*.rb'
    add_filter '/spec'
    add_filter '/vendor'
    add_filter '/.vendor'
  end
end

RSpec.configure do |c|
  default_facts = {}
  default_facts.merge!(YAML.load(File.read(File.expand_path('../default_facts.yml', __FILE__)))) if File.exist?(File.expand_path('../default_facts.yml', __FILE__))
  default_facts.merge!(YAML.load(File.read(File.expand_path('../default_module_facts.yml', __FILE__)))) if File.exist?(File.expand_path('../default_module_facts.yml', __FILE__))
  c.default_facts = default_facts

  # Coverage generation
  c.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end
