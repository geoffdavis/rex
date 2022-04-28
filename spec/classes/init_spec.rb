require 'spec_helper'
describe 'rex' do
  context 'with default values for all parameters' do
    it { is_expected.to contain_class('rex') }
  end
end
