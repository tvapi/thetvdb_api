require 'spec_helper'

describe ThetvdbApi::Series do
  let(:model) { ThetvdbApi::Series.new(ThetvdbApi::Client.new) }

  describe 'real request' do
    describe '.find' do
      it 'should return hash' do
        model.find('70327').class.should == Hash
      end
    end

    describe '.find_full' do
      it 'should return hash' do
        model.find_full('70327').class.should == Hash
      end
    end
  end
end
