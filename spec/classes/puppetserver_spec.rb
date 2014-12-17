require 'spec_helper'

describe 'puppetserver' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with defaults for all parameters' do
        it { should compile.with_all_deps }
        it { should contain_class('puppetserver') }
      end
    end
  end
end
