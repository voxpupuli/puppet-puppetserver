require 'spec_helper'

describe 'puppetserver::config::java_arg' do
  let(:title) { 'foo' }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge(
          memorysize_mb: '3072'
        )
      end

      context 'without param' do
        it 'fails' do
          is_expected.to raise_error(%r{Puppetserver::Config::Java_arg\[foo\]})
        end
      end

      context 'when value => bar' do
        let(:params) do
          {
            value: 'bar'
          }
        end

        context 'when not declaring Class[puppetserver]' do
          it 'fails' do
            is_expected.to raise_error(%r{Could not find resource 'Class\[Puppetserver::Install\]' for relationship on 'Puppetserver::Config::Java_arg\[foo\]'})
          end
        end

        context 'when declaring Class[puppetserver]' do
          let(:pre_condition) do
            "class { 'puppetserver': }"
          end

          let(:conffile) do
            case facts[:osfamily]
            when 'Debian'
              '/etc/default/puppetserver'
            when 'RedHat'
              '/etc/sysconfig/puppetserver'
            end
          end

          context 'with no ensure' do
            it { is_expected.to compile.with_all_deps }
            it do
              is_expected.to contain_augeas('Set puppetserver java_arg foo').with(
                lens:    'Shellvars_list.lns',
                incl:    conffile,
                changes: [
                  'set JAVA_ARGS/quote \'"\'',
                  "set JAVA_ARGS/value[.=~regexp('foo.*')] 'foobar'"
                ]
              )
            end
          end

          context 'with ensure => absent' do
            let(:params) do
              super().merge(
                ensure: 'absent'
              )
            end

            it { is_expected.to compile.with_all_deps }
            it do
              is_expected.to contain_augeas('Set puppetserver java_arg foo').with(
                lens:    'Shellvars_list.lns',
                incl:    conffile,
                changes: [
                  "rm JAVA_ARGS/value[.=~regexp('foo.*')]",
                  'rm JAVA_ARGS[count(value)=0]'
                ]
              )
            end
          end
        end
      end
    end
  end
end
