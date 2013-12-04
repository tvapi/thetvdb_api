require 'spec_helper'

describe ThetvdbApi::Request::Update do
  let(:klass) { ThetvdbApi::Request::Update }

  describe 'real request' do
    describe '#day' do
      it 'should return correct keys' do
        klass.day.result.keys.sort.should == [:series, :episodes, :banners].sort
      end
    end

    describe '#week' do
      it 'should return correct keys' do
        klass.week.result.keys.sort.should == [:series, :episodes, :banners].sort
      end
    end

    describe '#month' do
      it 'should return correct keys' do
        klass.month.result.keys.sort.should == [:series, :episodes, :banners].sort
      end
    end
  end
end
