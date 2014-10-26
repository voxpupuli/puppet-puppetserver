require 'spec_helper'

describe 'puppetserver' do

  context 'on Debian' do
    let(:facts) do
      {
        :osfamily => 'Debian',
      }
    end

    context 'with defaults for all parameters' do
      it { should compile.with_all_deps }
      it { should contain_class('puppetserver') }
    end
  end

  context 'on RedHat' do
    let(:facts) do
      {
        :osfamily => 'RedHat',
      }
    end

    context 'with defaults for all parameters' do
      it { should compile.with_all_deps }
      it { should contain_class('puppetserver') }
    end
  end
end
