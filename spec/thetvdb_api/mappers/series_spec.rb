require 'spec_helper'
require 'thetvdb_api/mappers/series'

describe ThetvdbApi::Mappers::Series do
  let(:klass) { ThetvdbApi::Mappers::Series }
  let(:model) { klass.new }

  describe '.banner_url' do
    it 'should return correct string' do
      model.stub(:banner_path).and_return('PATH')

      model.banner_url.should == 'http://thetvdb.com/banners/PATH'
    end
  end

  describe '.fanart_url' do
    it 'should return correct string' do
      model.stub(:fanart_path).and_return('PATH')

      model.fanart_url.should == 'http://thetvdb.com/banners/PATH'
    end
  end

  describe '.poster_url' do
    it 'should return correct string' do
      model.stub(:poster_path).and_return('PATH')

      model.poster_url.should == 'http://thetvdb.com/banners/PATH'
    end
  end
end
