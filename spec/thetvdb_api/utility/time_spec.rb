require 'spec_helper'

describe Time do
  describe '#coerce' do
    it 'should convert timestampe to Time' do
      Time.coerce('1201292806').should == Time.at(1201292806)
    end

    it 'should convert string datetime to Time' do
      Time.coerce('2000-01-01 11:11:11').should == Time.parse('2000-01-01 11:11:11')
    end
  end
end
