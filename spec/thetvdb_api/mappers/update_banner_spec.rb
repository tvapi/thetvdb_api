require 'spec_helper'

describe ThetvdbApi::Mappers::UpdateBanner do
  let(:klass) { ThetvdbApi::Mappers::UpdateBanner }
  let(:model) { klass.new }

  describe '.url' do
    it 'should return correct string' do
      model.stub(:path).and_return('PATH')

      model.url.should == 'http://thetvdb.com/banners/PATH'
    end
  end
end
