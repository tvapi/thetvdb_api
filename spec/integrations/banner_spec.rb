require 'spec_helper'

describe ThetvdbApi::Banner do
  let(:model) { ThetvdbApi::Banner.new(ThetvdbApi::Client.new) }

  describe 'real request' do
    describe '.find' do
      it 'should return hash' do
        model.find('72449').class.should == Hash
      end
    end
  end
end
