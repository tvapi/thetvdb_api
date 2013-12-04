require 'spec_helper'

describe ThetvdbApi::Request::Banner do
  let(:klass) { ThetvdbApi::Request::Banner }

  describe 'real request' do
    describe '#find' do
      it 'should return array' do
        klass.find('72449').result.class.should == Array
      end
    end
  end
end
