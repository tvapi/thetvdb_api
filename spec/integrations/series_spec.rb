require 'spec_helper'

describe ThetvdbApi::Series do
  let(:model) { ThetvdbApi::Series.new(ThetvdbApi::Client.new) }

  describe 'real request' do
    describe '.find' do
      it 'should return response class' do
        model.find('70327').class.should == HTTParty::Response
      end
    end

    describe '.find_full' do
      it 'should return response class' do
        model.find_full('70327').class.should == HTTParty::Response
      end
    end
  end
end
