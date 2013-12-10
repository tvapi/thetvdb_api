require 'spec_helper'

describe ThetvdbApi::Actor do
  let(:klass) { ThetvdbApi::Actor }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }

  describe '.find' do
    it 'should call new with specific params' do
      model.should_receive(:get).with('123456789/series/1234/actors.xml').and_return(double(response: true))

      model.find('1234')
    end
  end
end
