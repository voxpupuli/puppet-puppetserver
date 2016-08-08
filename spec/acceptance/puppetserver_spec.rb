require 'spec_helper_acceptance'

describe 'puppetserver' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-EOS
        class { 'puppetserver': }
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe package('puppetserver') do
      it { should be_installed }
    end

    describe service('puppetserver') do
      it do
        pending 'Fails on Debian8 (packaging issue?)' if fact('operatingsystem') == 'Debian' && fact('lsbdistcodename') == 'jessie'
        should be_enabled
      end
      it { should be_running }
    end

    describe port(8140) do
      it { should be_listening }
    end
  end

  context 'when overriding ssl-port' do
    it 'idempotentlies run' do
      pp = <<-EOS
        class { 'puppetserver':
          config => {
            'webserver' => {
              'ssl-port' => '18140',
            },
          },
        }
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe package('puppetserver') do
      it { should be_installed }
    end

    describe service('puppetserver') do
      it { should be_enabled }
      it { should be_running }
    end

    describe port(18140) do
      it { should be_listening }
    end

    describe port(8140) do
      it { should_not be_listening }
    end
  end
end
