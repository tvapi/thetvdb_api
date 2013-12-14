require 'spec_helper'

class ExampleClass < ThetvdbApi::Base
end

describe ThetvdbApi::Base do
  let(:klass) { ExampleClass }
  let(:model) { klass.new(ThetvdbApi::Client.new) }

  describe '.get' do
    it 'should set uri' do
      model.get('http://example.com')

      model.uri.should == 'http://example.com'
    end

    it 'should set options' do
      model.get('http://example.com', sample_options: true)

      model.options.should == { sample_options: true }
    end

    it 'should return self' do
      model.get('http://example.com').should == model
    end
  end

  describe '.response' do
    it 'should call get klass method' do
      klass.should_receive(:get)

      model.response
    end
  end

  describe '.series_uri' do
    it 'should use default api_key' do
      klass.new(ThetvdbApi::Client.new(api_key: 'API_KEY')).series_uri('1234').should == 'API_KEY/series/1234/'
    end
  end

  describe '.api_key' do
    it 'should use default api_key' do
      klass.new(ThetvdbApi::Client.new).api_key.should == ThetvdbApi::Configuration.api_key
    end

    it 'should set api_key' do
      klass.new(ThetvdbApi::Client.new(api_key: 'API_KEY')).api_key.should == 'API_KEY'
    end
  end

  describe '.langauge' do
    it 'should use default langauge' do
      klass.new(ThetvdbApi::Client.new).language.should == 'en'
    end

    it 'should set langauge' do
      klass.new(ThetvdbApi::Client.new(language: 'LANGUAGE')).language.should == 'LANGUAGE'
    end
  end
end
