require 'spec_helper'

describe 'puppetserver::repository' do

  context 'on Debian' do
    let(:facts) do
      {
        :lsbdistcodename => 'wheezy',
        :lsbdistid       => 'Debian',
        :osfamily        => 'Debian',
      }
    end

    context 'with defaults for all parameters' do
      it { should compile.with_all_deps }
      it { should contain_class('puppetserver::repository') }
    end
  end

  context 'on RedHat' do
    let(:facts) do
      {
        :operatingsystemmajrelease => '6',
        :osfamily                  => 'RedHat',
      }
    end

    context 'with defaults for all parameters' do
      it { should compile.with_all_deps }
      it { should contain_class('puppetserver::repository') }
    end
  end
end
