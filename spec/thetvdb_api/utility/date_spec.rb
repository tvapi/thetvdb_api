require 'spec_helper'

describe Date do
  describe '#coerce' do
    it 'should convert string to date' do
      Date.coerce('2001-02-03').should == Date.new(2001, 2, 3)
    end

    it 'should return nil for no date string' do
      Date.coerce('test').should == nil
    end
  end
end
