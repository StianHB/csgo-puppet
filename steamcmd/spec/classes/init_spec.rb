require 'spec_helper'
describe 'steamCMD' do

  context 'with defaults for all parameters' do
    it { should contain_class('steamCMD') }
  end
end
