#!/usr/bin/env rspec

require 'spec_helper'

puppetserver_config_type = Puppet::Type.type(:puppetserver_config)

describe puppetserver_config_type do
  context 'when setting parameters' do
    it 'should accept a name parameter' do
      resource = puppetserver_config_type.new :name => 'foo'
      expect(resource[:name]).to eq('foo')
    end

    it 'should accept a key parameter' do
      resource = puppetserver_config_type.new :name => 'foo', :key => 'bar'
      expect(resource[:key]).to eq('bar')
    end

    it 'should accept a value array parameter' do
      resource = puppetserver_config_type.new :name => 'foo', :value => ['foo', 'bar']
      expect(resource[:value]).to eq(['foo', 'bar'])
    end

    it 'should accept a path parameter' do
      resource = puppetserver_config_type.new :name => 'foo', :path => 'foo/bar'
      expect(resource[:path]).to eq('foo/bar')
    end

    it 'should accept a target parameter' do
      resource = puppetserver_config_type.new :name => 'foo', :target => '/foo/bar'
      expect(resource[:target]).to eq('/foo/bar')
    end

    it 'should fail if target is not an absolute path' do
      expect {
        puppetserver_config_type.new :name => 'foo', :target => 'foo'
      }.to raise_error
    end
  end
end

