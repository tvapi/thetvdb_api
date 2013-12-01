require 'spec_helper'

describe String do
  describe '#underscore' do
    it 'should convert camelCase to underscore' do
      'methodName'.underscore.should == 'method_name'
    end
  end
end
