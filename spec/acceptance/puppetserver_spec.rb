require 'spec_helper_acceptance'

describe 'puppetserver' do
  context 'with defaults' do
    it 'idempotently runs' do
      pp = <<-EOS
        class { 'puppetserver': }
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe package('puppetserver') do
      it { is_expected.to be_installed }
    end

    describe service('puppetserver') do
      it do
        pending 'Fails on Debian8 (packaging issue?)' if fact('operatingsystem') == 'Debian' && fact('lsbdistcodename') == 'jessie'
        is_expected.to be_enabled
      end
      it { is_expected.to be_running }
    end

    describe port(8140) do
      it { is_expected.to be_listening }
    end
  end

  context 'when overriding ssl-port' do
    it 'idempotently runs' do
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
      it { is_expected.to be_installed }
    end

    describe service('puppetserver') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end

    describe port(18_140) do
      it { is_expected.to be_listening }
    end

    describe port(8_140) do
      it { is_expected.not_to be_listening }
    end
  end
end
