require 'spec_helper'

describe Array do
  describe '#coerce' do
    it 'should convert string to array' do
      Array.coerce('|John|Jack').should == ['John', 'Jack']
    end
  end
end
