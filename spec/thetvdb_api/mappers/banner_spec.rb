require 'spec_helper'
require 'thetvdb_api/mappers/banner'

describe ThetvdbApi::Mappers::Banner do
  let(:klass) { ThetvdbApi::Mappers::Banner }
  let(:model) { klass.new }

  describe '.url' do
    it 'should return correct string' do
      model.stub(:path).and_return('PATH')

      model.url.should == 'http://thetvdb.com/banners/PATH'
    end
  end

  describe '.thumbnail_url' do
    it 'should return correct string' do
      model.stub(:thumbnail_path).and_return('PATH')

      model.thumbnail_url.should == 'http://thetvdb.com/banners/PATH'
    end
  end

  describe '.vignette_url' do
    it 'should return correct string' do
      model.stub(:vignette_path).and_return('PATH')

      model.vignette_url.should == 'http://thetvdb.com/banners/PATH'
    end
  end
end
