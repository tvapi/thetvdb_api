require 'spec_helper'
require 'thetvdb_api/mappers/actor'

describe ThetvdbApi::Mappers::Actor do
  let(:klass) { ThetvdbApi::Mappers::Actor }
  let(:model) { klass.new }

  describe '.image_url' do
    it 'should return correct string' do
      model.stub(:image_path).and_return('PATH')

      model.image_url.should == 'http://thetvdb.com/banners/PATH'
    end
  end
end
