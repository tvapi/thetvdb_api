require 'spec_helper'

describe ThetvdbApi::Request::Actor do
  let(:klass) { ThetvdbApi::Request::Actor }

  describe 'real request' do
    describe '#find' do
      it 'should return array' do
        klass.find('70327').result.class.should == Array
      end
    end
  end
end
