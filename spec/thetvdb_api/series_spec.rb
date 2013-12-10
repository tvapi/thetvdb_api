require 'spec_helper'

describe ThetvdbApi::Series do
  let(:klass) { ThetvdbApi::Series }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }

  describe '.find' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('123456789/series/1234/en.xml').and_return(double(response: true))

      model.find('1234', 'en')
    end
  end

  describe '.find_full' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('123456789/series/1234/all/en.xml').and_return(double(response: true))

      model.find_full('1234', 'en')
    end
  end
end
