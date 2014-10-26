require 'spec_helper_acceptance'

describe 'puppetserver' do

  context 'with defaults' do
    it 'should idempotently run' do
      pp = <<-EOS
        class { 'puppetserver': }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe package('puppetserver') do
      it { should be_installed }
    end

    describe service('puppetserver') do
      it { should be_enabled }
      it { should be_running }
    end

    describe port(8140) do
      pending 'Need to wait for puppetserver to start'
      it { should be_listening.with('tcp') }
    end
  end
end
