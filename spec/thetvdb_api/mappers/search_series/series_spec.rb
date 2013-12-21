require 'spec_helper'
require 'thetvdb_api/mappers/search_series/series'

describe ThetvdbApi::Mappers::SearchSeries::Series do
  let(:klass) { ThetvdbApi::Mappers::SearchSeries::Series }
  let(:model) { klass.new }

  describe '.banner_url' do
    it 'should return correct string' do
      model.stub(:banner_path).and_return('PATH')

      model.banner_url.should == 'http://thetvdb.com/banners/PATH'
    end
  end
end
