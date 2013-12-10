require 'spec_helper'

describe ThetvdbApi::Update do
  let(:model) { ThetvdbApi::Update.new(ThetvdbApi::Client.new) }

  describe 'real request' do
    describe '.day' do
      it 'should return hash' do
        model.day.class.should == Hash
      end
    end

    describe '.week' do
      it 'should return hash' do
        model.week.class.should == Hash
      end
    end

    describe '.month' do
      it 'should return hash' do
        model.month.class.should == Hash
      end
    end
  end
end
