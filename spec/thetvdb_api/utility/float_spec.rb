require 'spec_helper'

describe Float do
  describe '#coerce' do
    it 'should convert string to float' do
      Float.coerce('12.34').should == 12.34
    end
  end
end