require 'spec_helper'

describe Integer do
  describe '#coerce' do
    it 'should convert string to integer' do
      Integer.coerce('1234').should == 1234
    end
  end
end
