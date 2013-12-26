require 'spec_helper'

describe ThetvdbApi::Update do
  let(:model) { ThetvdbApi::Update.new(ThetvdbApi::Client.new) }

  describe 'real request' do
    describe '.day' do
      it 'should return response class' do
        model.day.class.should == ThetvdbApi::Response::Update
      end
    end

    describe '.week' do
      it 'should return response class' do
        model.week.class.should == ThetvdbApi::Response::Update
      end
    end

    describe '.month' do
      it 'should return response class' do
        model.month.class.should == ThetvdbApi::Response::Update
      end
    end

    describe '.all' do
      it 'should return response class' do
        model.all.class.should == ThetvdbApi::Response::Update
      end
    end
  end
end