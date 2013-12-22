require 'spec_helper'

describe ThetvdbApi::Actor do
  let(:klass) { ThetvdbApi::Actor }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }
  let(:mock_model) { SampleModel.new }

  describe '.find' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/series/{series_id}/actors.xml').and_return(mock_model)

      model.find('1234')
    end

    it 'should call params with specific params' do
      model.should_receive(:params).with(series_id: '1234').and_return(mock_model)

      model.find('1234')
    end
  end
end
