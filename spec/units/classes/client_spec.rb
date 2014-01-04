require 'units/unit_spec_helper'

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

  describe '.actor' do
    it 'should return actor class' do
      klass.new.actor.class.should == ThetvdbApi::Actor
    end
  end

  describe '.banner' do
    it 'should return banner class' do
      klass.new.banner.class.should == ThetvdbApi::Banner
    end
  end

  describe '.episode' do
    it 'should return episode class' do
      klass.new.episode.class.should == ThetvdbApi::Episode
    end
  end

  describe '.update' do
    it 'should return update class' do
      klass.new.update.class.should == ThetvdbApi::Update
    end
  end
end
