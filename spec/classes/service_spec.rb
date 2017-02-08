require 'spec_helper'

describe 'puppetserver::service' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with defaults for all parameters' do
        let(:pre_condition) do
          "class { 'puppetserver': }"
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('puppetserver::service') }
        it { is_expected.to contain_service('puppetserver').with('ensure' => 'running') }
        it { is_expected.to contain_service('puppetserver').with('enable' => true) }
      end

      context 'with custom service name' do
        let(:pre_condition) do
          "class { 'puppetserver':
            service => 'foo',
          }"
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('puppetserver::service') }
        it { is_expected.to contain_service('foo').with('ensure' => 'running') }
        it { is_expected.to contain_service('foo').with('enable' => true) }
      end

      context 'with service disabled' do
        let(:pre_condition) do
          "class { 'puppetserver':
            enable => false,
          }"
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('puppetserver::service') }
        it { is_expected.to contain_service('puppetserver').with('ensure' => 'running') }
        it { is_expected.to contain_service('puppetserver').with('enable' => false) }
      end

      context 'with service stopped' do
        let(:pre_condition) do
          "class { 'puppetserver':
            start => false,
          }"
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('puppetserver::service') }
        it { is_expected.to contain_service('puppetserver').with('ensure' => 'stopped') }
        it { is_expected.to contain_service('puppetserver').with('enable' => true) }
      end

      context 'with service not managed' do
        let(:pre_condition) do
          "class { 'puppetserver':
            manage_service => false,
          }"
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('puppetserver::service') }
        it { is_expected.not_to contain_service('puppetserver') }
      end
    end
  end
end
