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
