require 'spec_helper'

describe 'puppetserver' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with defaults for all parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('puppetserver') }
        it { is_expected.to contain_class('puppetserver::install') }
        it { is_expected.to contain_class('puppetserver::config') }
        it { is_expected.to contain_class('puppetserver::service') }
      end
    end
  end
end
