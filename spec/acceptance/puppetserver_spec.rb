require 'spec_helper_acceptance'

describe 'puppetserver' do

  context 'with defaults' do
    it 'should idempotently run' do
      pp = <<-EOS
        class { 'puppetserver': }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe port(8140) do
      it { is_expected.to be_listening }
    end
  end
end
