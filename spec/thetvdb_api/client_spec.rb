require 'spec_helper'

describe ThetvdbApi::Client do
  let(:klass) { ThetvdbApi::Client }

  describe '.search' do
    it 'should return search class' do
      klass.new.search.class.should == ThetvdbApi::Search
    end
  end

  describe '.series' do
    it 'should return series class' do
      klass.new.series.class.should == ThetvdbApi::Series
    end
  end
end
