require 'spec_helper'

describe Player do

  it 'has a valid factory' do
    FactoryGirl.create(:player).should be_valid
  end

  describe '#full_name' do

    it 'sets full_name from first_name and last_name' do
      FactoryGirl.create(:player).full_name.should == 'John Smith'
    end

  end

end
