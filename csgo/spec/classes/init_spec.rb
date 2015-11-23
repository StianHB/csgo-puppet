require 'spec_helper'
describe 'csgo' do

  context 'with defaults for all parameters' do
    it { should contain_class('csgo') }
  end
end
