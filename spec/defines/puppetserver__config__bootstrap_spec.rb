require 'spec_helper'

describe 'puppetserver::config::bootstrap' do
  let(:title) { 'foo' }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      context 'without param' do
        it do
          is_expected.to contain_augeas('Set puppetserver bootstrap foo').with(
            lens:    'Simplelines.lns',
            incl:    '/etc/puppetlabs/puppetserver/bootstrap.cfg',
            changes: 'set ./01 \'foo\'',
            onlyif:  'match ./*[label()!=\'#comment\' and .=\'foo\'] size == 0'
          )
        end
      end

      context 'when ensure => absent' do
        let(:params) { { ensure: 'absent' } }

        it do
          is_expected.to contain_augeas('Set puppetserver bootstrap foo').with(
            changes: 'rm ./*[label()!=\'#comment\' and .=\'foo\']',
            onlyif:  'match ./*[label()!=\'#comment\' and .=\'foo\'] size != 0'
          )
        end
      end

      context 'when fact puppetversion => 3.9.9' do
        let(:facts) { facts.merge(puppetversion: '3.9.9') }

        it { is_expected.to contain_augeas('Set puppetserver bootstrap foo').with_incl('/etc/puppetserver/bootstrap.cfg') }
      end

      context 'when fact puppetversion => 4.0.0' do
        let(:facts) { facts.merge(puppetversion: '4.0.0') }

        it { is_expected.to contain_augeas('Set puppetserver bootstrap foo').with_incl('/etc/puppetlabs/puppetserver/bootstrap.cfg') }
      end

      context 'when targetfile => /etc/puppetlabs/puppetserver/services.d/ca.cfg' do
        let(:params) { { targetfile: '/etc/puppetlabs/puppetserver/services.d/ca.cfg' } }

        it { is_expected.to contain_augeas('Set puppetserver bootstrap foo').with_incl('/etc/puppetlabs/puppetserver/services.d/ca.cfg') }
      end
    end
  end

  describe 'variable data type and content validations' do
    validations = {
      'Optional[Stdlib::Absolutepath]' => {
        param:   %w[targetfile],
        valid:   %w[/absolute/filepath /absolute/directory/],
        invalid: ['../string', %w[array], { 'ha' => 'sh' }, 3, 2.42, false, nil],
        message: 'expects a (match for|match for Stdlib::Absolutepath =|Stdlib::Absolutepath =) Variant\[Stdlib::Windowspath.*Stdlib::Unixpath' # Puppet (4.x|5.0 & 5.1|5.x)
      },
      'String for ensure' => {
        param:   %w[ensure],
        valid:   %w[absent present],
        invalid: ['string', %w[array], { 'ha' => 'sh' }, 3, 2.42, false],
        message: 'Wrong value for "ensure"'
      }
    }

    validations.sort.each do |type, var|
      mandatory_facts = {} if mandatory_facts.nil?
      mandatory_params = {} if mandatory_params.nil?
      var[:param].each do |parameter|
        var[:facts] = {} if var[:facts].nil?
        var[:params] = {} if var[:params].nil?

        var[:valid].each do |valid|
          context "when #{parameter} (#{type}) is set to valid #{valid} (as #{valid.class})" do
            let(:facts) { [mandatory_facts, var[:facts]].reduce(:merge) }
            let(:params) { [mandatory_params, var[:params], { :"#{parameter}" => valid }].reduce(:merge) }

            it { is_expected.to compile }
          end
        end

        var[:invalid].each do |invalid|
          context "when #{parameter} (#{type}) is set to invalid #{invalid} (as #{invalid.class})" do
            let(:params) { [mandatory_params, var[:params], { :"#{parameter}" => invalid }].reduce(:merge) }

            it 'fails' do
              expect { is_expected.to contain_class(subject) }.to raise_error(Puppet::Error, %r{#{var[:message]}})
            end
          end
        end
      end
    end
  end
end
