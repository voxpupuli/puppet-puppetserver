# Puppetserver

[![Puppet Forge](http://img.shields.io/puppetforge/v/camptocamp/puppetserver.svg)](https://forge.puppetlabs.com/camptocamp/puppetserver)
[![Build Status](https://travis-ci.org/camptocamp/puppet-puppetserver.png?branch=master)](https://travis-ci.org/camptocamp/puppet-puppetserver)

## Overview

The puppetserver module allows you to easily manage Puppetserver with Puppet.

## Usage

```puppet
class { 'puppetserver::repository': } ->
class { 'puppetserver': }
```
