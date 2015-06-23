## 2015-06-23 - Release 0.10.

Support custom package name

## 2015-05-28 - Release 0.9.7

Add beaker_spec_helper to Gemfile

## 2015-05-26 - Release 0.9.6

Use random application order in nodeset

## 2015-05-26 - Release 0.9.5

add utopic & vivid nodesets

## 2015-05-25 - Release 0.9.4

Don't allow failure on Puppet 4

## 2015-05-13 - Release 0.9.3

Add puppet-lint-file_source_rights-check gem

## 2015-05-12 - Release 0.9.2

Don't pin beaker

## 2015-04-27 - Release 0.9.1

Add nodeset ubuntu-12.04-x86_64-openstack

## 2015-04-03 - Release 0.9.0

- Remove acceptance tests from travis (puppetserver requires too much memory to
  start)
- Use lens_content and test_content instead of lens_source and test_source for
  augeas::lens resources
- Don't manage /var/lib/puppet/ssl (fixed upstream)
- Remove RedHat 5 support (it may still work though)
- Confine rspec pinning to ruby 1.8
- Simplify spec/spec_helper_acceptance.rb

## 2015-03-24 - Release 0.8.0

- Add puppetserver::config::boostrap to configure bootstrap.cfg
- Fix /var/lib/puppet/ssl ownership

## 2015-03-09 - Release 0.7.0

- Add a puppetserver::hiera::eyaml class
- Various specs improvements

## 2015-02-18 - Release 0.6.1

- Fix specs for minimal memory size

## 2015-02-18 - Release 0.6.0

- Do not check for minimal memory size
- Fix puppet lint configuration in specs

## 2015-02-17 - Release 0.5.1

- Properly confine the puppetserver_gem provider

## 2015-02-16 - Release 0.5.0

- Various rspec improvements
- Use rspec-puppet-facts in specs
- Various linting
- Add anchors in puppetserver class
- Add puppetserver_gem package provider

## 2015-01-07 - Release 0.4.3

Fix unquoted strings in cases

## 2015-01-06 - Release 0.4.2

Fix .travis.yml

## 2014-12-18 - Release 0.4.1

Various improvements in unit tests

## 2014-11-12 Release 0.4.0
### Summary

- General

  * Drop support for Puppet 2.7 in tests
  * Use Travis DPL for releases

## 2014-10-28 Release 0.3.0
### Summary

- Definitions

  * Fix missing slash in puppetserver::conf::puppetserver

- Augeas lens

  * Support optional double quotes in values


## 2014-10-28 Release 0.2
### Summary

- Classes

  * Add a config parameter in the puppetserver class

- Definitions

  * Add configuration defined types

- Tests

  * Create nodesets with memsize set to 3072
