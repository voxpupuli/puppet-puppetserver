require 'spec_helper'

provider_class = Puppet::Type.type(:puppetserver_config).provider(:augeas)

# skip until someone knows how to fix the problems
# it works locally for me on Fedora 25 but travis fails on them
describe provider_class, skip: true do
  context 'with empty file' do
    let(:tmptarget) { aug_fixture('empty') }
    let(:target) { tmptarget.path }

    it 'creates simple new entry' do
      apply!(Puppet::Type.type(:puppetserver_config).new(
               name: 'foo',
               key: 'foo',
               path: 'bar',
               value: '42',
               target: target,
               provider: 'augeas'
      ))

      aug_open(target, 'Trapperkeeper.lns') do |aug|
        expect(aug.get('@hash/@simple/@value')).to eq('42')
      end
    end

    it 'creates an array entry' do # rubocop:disable RSpec/MultipleExpectations
      apply!(Puppet::Type.type(:puppetserver_config).new(
               name: 'foo',
               key: 'foo',
               path: 'bar',
               value: %w[42 24],
               target: target,
               provider: 'augeas'
      ))

      aug_open(target, 'Trapperkeeper.lns') do |aug|
        expect(aug.get('@hash/@array/1')).to eq('42')
        expect(aug.get('@hash/@array/2')).to eq('24')
      end
    end
  end

  context 'with full file' do
    let(:tmptarget) { aug_fixture('full') }
    let(:target) { tmptarget.path }

    describe 'when creating settings' do
      it 'creates a simple entry' do
        apply!(Puppet::Type.type(:puppetserver_config).new(
                 name: 'foo',
                 key: 'foo',
                 path: 'bar',
                 value: '42',
                 target: target,
                 provider: 'augeas'
        ))

        aug_open(target, 'Trapperkeeper.lns') do |aug|
          expect(aug.get("@hash/@simple[.='foo']/@value")).to eq('42')
        end
      end

      it 'creates an array entry' do # rubocop:disable RSpec/MultipleExpectations
        apply!(Puppet::Type.type(:puppetserver_config).new(
                 name: 'foo',
                 key: 'foo',
                 path: 'bar',
                 value: %w[42 24],
                 target: target,
                 provider: 'augeas'
        ))

        aug_open(target, 'Trapperkeeper.lns') do |aug|
          expect(aug.get("@hash/@array[.='foo']/1")).to eq('42')
          expect(aug.get("@hash/@array[.='foo']/2")).to eq('24')
        end
      end
    end

    describe 'when deleting settings' do
      it 'deletes a setting' do
        apply!(Puppet::Type.type(:puppetserver_config).new(
                 name: 'client-whitelist',
                 key: 'client-whitelist',
                 path: 'puppet-admin',
                 ensure: :absent,
                 type: :array,
                 target: target,
                 provider: 'augeas'
        ))

        aug_open(target, 'Trapperkeeper.lns') do |aug|
          expect(aug.match("@hash/@array[.='client-whitelist']").size).to eq(0)
        end
      end
    end

    describe 'when updating settings' do
      it 'replaces a setting' do # rubocop:disable RSpec/MultipleExpectations
        apply!(Puppet::Type.type(:puppetserver_config).new(
                 name: 'client-whitelist',
                 key: 'client-whitelist',
                 path: 'puppet-admin',
                 value: %w[foo bar],
                 target: target,
                 provider: 'augeas'
        ))

        aug_open(target, 'Trapperkeeper.lns') do |aug|
          expect(aug.get("@hash/@array[.='client-whitelist']/1")).to eq('foo')
          expect(aug.get("@hash/@array[.='client-whitelist']/2")).to eq('bar')
        end
      end
    end
  end

  context 'with broken file' do
    let(:tmptarget) { aug_fixture('broken') }
    let(:target) { tmptarget.path }

    it 'fails to load' do # rubocop:disable RSpec/MultipleExpectations
      txn = apply(Puppet::Type.type(:puppetserver_config).new(
                    name: 'foo',
                    value: 'yes',
                    target: target,
                    provider: 'augeas'
      ))

      expect(txn.any_failed?).not_to eq(nil)
      expect(@logs.first.level).to eq(:err) # rubocop:disable RSpec/InstanceVariable
      expect(@logs.first.message.include?(target)).to eq(true) # rubocop:disable RSpec/InstanceVariable
    end
  end
end
