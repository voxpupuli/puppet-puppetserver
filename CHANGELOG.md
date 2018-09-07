# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v3.0.1](https://github.com/voxpupuli/puppet-puppetserver/tree/v3.0.1) (2018-09-07)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/v3.0.0...v3.0.1)

**Closed issues:**

- Release 2.2.0 [\#45](https://github.com/voxpupuli/puppet-puppetserver/issues/45)
- Release 3.0.0 [\#43](https://github.com/voxpupuli/puppet-puppetserver/issues/43)

**Merged pull requests:**

- Allow puppetlabs/stdlib 5.x [\#70](https://github.com/voxpupuli/puppet-puppetserver/pull/70) ([bastelfreak](https://github.com/bastelfreak))
- drop EOL OSs; fix puppet version range [\#60](https://github.com/voxpupuli/puppet-puppetserver/pull/60) ([bastelfreak](https://github.com/bastelfreak))
- Fix typo in README [\#53](https://github.com/voxpupuli/puppet-puppetserver/pull/53) ([Phil-Friderici](https://github.com/Phil-Friderici))

## [v3.0.0](https://github.com/voxpupuli/puppet-puppetserver/tree/v3.0.0) (2017-12-20)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/2.1.0...v3.0.0)

**Breaking changes:**

- Use stahnma/puppetlabs\_yum and ploperations/puppetlabs\_apt to handle Puppet repositories [\#37](https://github.com/voxpupuli/puppet-puppetserver/issues/37)
- Use puppetlabs/puppetserver\_gem \(BREAKING\) [\#42](https://github.com/voxpupuli/puppet-puppetserver/pull/42) ([vinzent](https://github.com/vinzent))

**Implemented enhancements:**

- Depend on puppetlabs/puppetserver\_gem instead of including it [\#28](https://github.com/voxpupuli/puppet-puppetserver/issues/28)
- puppetserver::repository should handle the PC1 repo ? [\#18](https://github.com/voxpupuli/puppet-puppetserver/issues/18)
- Added tmpdir parameter to java args. Is needed for CIS hardened servers [\#38](https://github.com/voxpupuli/puppet-puppetserver/pull/38) ([Fabian1976](https://github.com/Fabian1976))

**Fixed bugs:**

- Travis shows acceptance tests green but are not run [\#39](https://github.com/voxpupuli/puppet-puppetserver/issues/39)

**Merged pull requests:**

- Release 3.0 [\#50](https://github.com/voxpupuli/puppet-puppetserver/pull/50) ([vinzent](https://github.com/vinzent))
- bump dep on apt to '\< 5.0.0'; use long gpg id [\#48](https://github.com/voxpupuli/puppet-puppetserver/pull/48) ([costela](https://github.com/costela))
- Set min version\_requirement for Puppet + deps [\#36](https://github.com/voxpupuli/puppet-puppetserver/pull/36) ([juniorsysadmin](https://github.com/juniorsysadmin))
- Revert "modulesync 0.12.5" [\#31](https://github.com/voxpupuli/puppet-puppetserver/pull/31) ([bbriggs](https://github.com/bbriggs))
- modulesync 0.12.5 [\#30](https://github.com/voxpupuli/puppet-puppetserver/pull/30) ([bastelfreak](https://github.com/bastelfreak))
- Added manage\_service option [\#27](https://github.com/voxpupuli/puppet-puppetserver/pull/27) ([mvisonneau](https://github.com/mvisonneau))
- Remove hardcoded version for hiera-eyaml-gpg [\#26](https://github.com/voxpupuli/puppet-puppetserver/pull/26) ([willaerk](https://github.com/willaerk))

## [2.1.0](https://github.com/voxpupuli/puppet-puppetserver/tree/2.1.0) (2016-03-15)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/2.0.1...2.1.0)

**Closed issues:**

- auth.conf not parsable by the trapperkeeper lens  [\#23](https://github.com/voxpupuli/puppet-puppetserver/issues/23)

**Merged pull requests:**

- added support for a yum proxy and setting the baseurl for yum repositories [\#22](https://github.com/voxpupuli/puppet-puppetserver/pull/22) ([tosmi](https://github.com/tosmi))

## [2.0.1](https://github.com/voxpupuli/puppet-puppetserver/tree/2.0.1) (2015-09-21)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/2.0.0...2.0.1)

**Fixed bugs:**

- Fix creation of new entries [\#14](https://github.com/voxpupuli/puppet-puppetserver/issues/14)
- trapperkeeper augeas lens fails for ruby-load-path [\#11](https://github.com/voxpupuli/puppet-puppetserver/issues/11)
- undocumented dependency: camptocamp/agueas [\#6](https://github.com/voxpupuli/puppet-puppetserver/issues/6)

**Merged pull requests:**

- Fix puppetlabs-apt version dependency [\#17](https://github.com/voxpupuli/puppet-puppetserver/pull/17) ([roman-mueller](https://github.com/roman-mueller))

## [2.0.0](https://github.com/voxpupuli/puppet-puppetserver/tree/2.0.0) (2015-09-14)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/1.0.0...2.0.0)

**Fixed bugs:**

- Trapperkeeper lens fails web-routes.conf [\#7](https://github.com/voxpupuli/puppet-puppetserver/issues/7)

**Merged pull requests:**

- different path for bootstrap.cfg on puppetserver 2.x [\#12](https://github.com/voxpupuli/puppet-puppetserver/pull/12) ([mmckinst](https://github.com/mmckinst))

## [1.0.0](https://github.com/voxpupuli/puppet-puppetserver/tree/1.0.0) (2015-07-09)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.11.1...1.0.0)

**Closed issues:**

- Add support for puppet server 2.0 [\#9](https://github.com/voxpupuli/puppet-puppetserver/issues/9)

**Merged pull requests:**

- Initial support for puppetserver 2.0.0 paths [\#8](https://github.com/voxpupuli/puppet-puppetserver/pull/8) ([roman-mueller](https://github.com/roman-mueller))

## [0.11.1](https://github.com/voxpupuli/puppet-puppetserver/tree/0.11.1) (2015-06-26)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.11.0...0.11.1)

## [0.11.0](https://github.com/voxpupuli/puppet-puppetserver/tree/0.11.0) (2015-06-25)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.10.0...0.11.0)

## [0.10.0](https://github.com/voxpupuli/puppet-puppetserver/tree/0.10.0) (2015-06-23)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.9.7...0.10.0)

**Merged pull requests:**

- Support custom package name [\#10](https://github.com/voxpupuli/puppet-puppetserver/pull/10) ([tdevelioglu](https://github.com/tdevelioglu))

## [0.9.7](https://github.com/voxpupuli/puppet-puppetserver/tree/0.9.7) (2015-05-28)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.9.6...0.9.7)

## [0.9.6](https://github.com/voxpupuli/puppet-puppetserver/tree/0.9.6) (2015-05-26)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.9.5...0.9.6)

## [0.9.5](https://github.com/voxpupuli/puppet-puppetserver/tree/0.9.5) (2015-05-26)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.9.4...0.9.5)

## [0.9.4](https://github.com/voxpupuli/puppet-puppetserver/tree/0.9.4) (2015-05-25)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.9.3...0.9.4)

## [0.9.3](https://github.com/voxpupuli/puppet-puppetserver/tree/0.9.3) (2015-05-13)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.9.2...0.9.3)

## [0.9.2](https://github.com/voxpupuli/puppet-puppetserver/tree/0.9.2) (2015-05-12)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.9.1...0.9.2)

## [0.9.1](https://github.com/voxpupuli/puppet-puppetserver/tree/0.9.1) (2015-04-27)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.9.0...0.9.1)

## [0.9.0](https://github.com/voxpupuli/puppet-puppetserver/tree/0.9.0) (2015-04-03)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.8.0...0.9.0)

**Closed issues:**

- how to configure puppet.conf [\#4](https://github.com/voxpupuli/puppet-puppetserver/issues/4)

## [0.8.0](https://github.com/voxpupuli/puppet-puppetserver/tree/0.8.0) (2015-03-24)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.7.0...0.8.0)

**Merged pull requests:**

- Fix /var/lib/puppet/ssl ownership on Debian7 [\#5](https://github.com/voxpupuli/puppet-puppetserver/pull/5) ([mcanevet](https://github.com/mcanevet))

## [0.7.0](https://github.com/voxpupuli/puppet-puppetserver/tree/0.7.0) (2015-03-09)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.6.1...0.7.0)

## [0.6.1](https://github.com/voxpupuli/puppet-puppetserver/tree/0.6.1) (2015-02-18)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.6.0...0.6.1)

## [0.6.0](https://github.com/voxpupuli/puppet-puppetserver/tree/0.6.0) (2015-02-18)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.5.1...0.6.0)

## [0.5.1](https://github.com/voxpupuli/puppet-puppetserver/tree/0.5.1) (2015-02-17)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.5.0...0.5.1)

## [0.5.0](https://github.com/voxpupuli/puppet-puppetserver/tree/0.5.0) (2015-02-16)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.4.3...0.5.0)

## [0.4.3](https://github.com/voxpupuli/puppet-puppetserver/tree/0.4.3) (2015-01-07)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.4.2...0.4.3)

## [0.4.2](https://github.com/voxpupuli/puppet-puppetserver/tree/0.4.2) (2015-01-06)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.4.1...0.4.2)

## [0.4.1](https://github.com/voxpupuli/puppet-puppetserver/tree/0.4.1) (2014-12-18)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.4.0...0.4.1)

**Closed issues:**

- tarball on puppet forge is broken [\#3](https://github.com/voxpupuli/puppet-puppetserver/issues/3)

## [0.4.0](https://github.com/voxpupuli/puppet-puppetserver/tree/0.4.0) (2014-11-12)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.3.0...0.4.0)

## [0.3.0](https://github.com/voxpupuli/puppet-puppetserver/tree/0.3.0) (2014-10-28)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.2.0...0.3.0)

## [0.2.0](https://github.com/voxpupuli/puppet-puppetserver/tree/0.2.0) (2014-10-28)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.1.1...0.2.0)

## [0.1.1](https://github.com/voxpupuli/puppet-puppetserver/tree/0.1.1) (2014-10-27)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/0.1.0...0.1.1)

## [0.1.0](https://github.com/voxpupuli/puppet-puppetserver/tree/0.1.0) (2014-10-27)

[Full Changelog](https://github.com/voxpupuli/puppet-puppetserver/compare/3b0dd66b6b9dc48b889fbd3bd70e049449bd2d00...0.1.0)

**Merged pull requests:**

- Manage configuration options with a hash [\#2](https://github.com/voxpupuli/puppet-puppetserver/pull/2) ([raphink](https://github.com/raphink))
- Manage JAVA\_ARGS parameters individually [\#1](https://github.com/voxpupuli/puppet-puppetserver/pull/1) ([raphink](https://github.com/raphink))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
