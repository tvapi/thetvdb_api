require 'spec_helper'
require 'thetvdb_api/mappers/update/banner'

describe ThetvdbApi::Mappers::Update::Banner do
  let(:klass) { ThetvdbApi::Mappers::Update::Banner }
  let(:model) { klass.new }

  describe '.url' do
    it 'should return correct string' do
      model.stub(:path).and_return('PATH')

      model.url.should == 'http://thetvdb.com/banners/PATH'
    end
  end
end
