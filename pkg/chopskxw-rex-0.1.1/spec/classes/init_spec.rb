require 'spec_helper'
describe 'rex' do
  context 'with default values for all parameters' do
    it { should contain_class('rex') }
  end
end
