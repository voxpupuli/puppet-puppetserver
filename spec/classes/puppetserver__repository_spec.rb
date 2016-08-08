require 'spec_helper'

describe 'puppetserver::repository' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with defaults for all parameters' do
        it { should compile.with_all_deps }
        it { should contain_class('puppetserver::repository') }
      end

      case facts[:osfamily]
      when 'RedHat'
        context 'on redhat without parameters set' do
          it { should contain_yumrepo('puppetlabs-deps').without_proxy }
          it { should contain_yumrepo('puppetlabs-deps').without_proxy_username }
          it { should contain_yumrepo('puppetlabs-deps').without_proxy_password }
          it { should contain_yumrepo('puppetlabs-deps').with_baseurl(/yum.puppetlabs.com/) }

          it { should contain_yumrepo('puppetlabs-products').without_proxy }
          it { should contain_yumrepo('puppetlabs-products').without_proxy_username }
          it { should contain_yumrepo('puppetlabs-products').without_proxy_password }
          it { should contain_yumrepo('puppetlabs-products').with_baseurl(/yum.puppetlabs.com/) }
        end

        context 'on redhat with parameters set' do
          let(:params) do
            {
              yum_proxy: 'http://proxy:8080/',
              yum_proxy_username: 'user',
              yum_proxy_password: 'password',
              yum_deps_baseurl: 'http://yum.internal/deps/',
              yum_products_baseurl: 'http://yum.internal/products/'
            }
          end
          it { should contain_yumrepo('puppetlabs-deps').with('proxy' => 'http://proxy:8080/') }
          it { should contain_yumrepo('puppetlabs-deps').with('proxy_username' => 'user') }
          it { should contain_yumrepo('puppetlabs-deps').with('proxy_password' => 'password') }
          it { should contain_yumrepo('puppetlabs-deps').with_baseurl(/yum.internal/) }

          it { should contain_yumrepo('puppetlabs-products').with('proxy' => 'http://proxy:8080/') }
          it { should contain_yumrepo('puppetlabs-products').with('proxy_username' => 'user') }
          it { should contain_yumrepo('puppetlabs-products').with('proxy_password' => 'password') }
          it { should contain_yumrepo('puppetlabs-products').with_baseurl(/yum.internal/) }
        end
      end
    end
  end
end
