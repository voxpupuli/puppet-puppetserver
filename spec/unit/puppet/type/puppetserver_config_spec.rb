require 'spec_helper'

puppetserver_config_type = Puppet::Type.type(:puppetserver_config)

describe puppetserver_config_type do
  context 'when setting parameters' do
    it 'accepts a name parameter' do
      resource = puppetserver_config_type.new name: 'foo'
      expect(resource[:name]).to eq('foo')
    end

    it 'accepts a key parameter' do
      resource = puppetserver_config_type.new name: 'foo', key: 'bar'
      expect(resource[:key]).to eq('bar')
    end

    it 'accepts a value array parameter' do
      resource = puppetserver_config_type.new name: 'foo', value: %w[foo bar]
      expect(resource[:value]).to eq(%w[foo bar])
    end

    it 'accepts a path parameter' do
      resource = puppetserver_config_type.new name: 'foo', path: 'foo/bar'
      expect(resource[:path]).to eq('foo/bar')
    end

    it 'accepts a target parameter' do
      resource = puppetserver_config_type.new name: 'foo', target: '/foo/bar'
      expect(resource[:target]).to eq('/foo/bar')
    end

    it 'fails if target is not an absolute path' do
      expect do
        puppetserver_config_type.new name: 'foo', target: 'foo'
      end.to raise_error
    end
  end
end
