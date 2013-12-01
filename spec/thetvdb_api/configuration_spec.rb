require 'spec_helper'

describe ThetvdbApi::Configuration do
  describe '#api_url' do
    it 'should return correct value' do
      ThetvdbApi::Configuration.api_url.should == 'http://thetvdb.com/api/'
    end
  end
end
