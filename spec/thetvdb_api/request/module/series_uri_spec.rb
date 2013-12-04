require 'spec_helper'

class ExampleModel
  include ThetvdbApi::Request::Module::SeriesUri
end

describe ThetvdbApi::Request::Module::SeriesUri do
  let(:klass) { ExampleModel }

  describe '#series_uri' do
    it 'should return correct uri' do
      ThetvdbApi::Configuration.stub(:api_key).and_return('API_KEY')

      klass.series_uri('1234').should == 'API_KEY/series/1234/'
    end
  end
end
