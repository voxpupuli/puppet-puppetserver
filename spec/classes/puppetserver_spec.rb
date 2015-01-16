require 'spec_helper'

describe 'puppetserver' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with less than 2GB of RAM' do
        let(:facts) do
          super().merge({
            :memorysize_mb => '2000',
          })
        end

        it { expect { is_expected.to compile }.to raise_error(/Puppetserver needs at least 2GB of memory to start/) }
      end

      context 'with more than 2GB of RAM' do
        let(:facts) do
          super().merge({
            :memorysize_mb => '3072',
          })
        end

        context 'with defaults for all parameters' do
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('puppetserver') }
        end
      end
    end
  end
end
