require 'spec_helper'

describe ThetvdbApi::Actor do
  let(:model) { ThetvdbApi::Actor.new(ThetvdbApi::Client.new) }

  describe 'real request' do
    describe '.find' do
      it 'should return response class' do
        model.find('70327').class.should == Faraday::Response
      end
    end
  end
end
