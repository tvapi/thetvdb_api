require 'units/unit_spec_helper'

class ExampleClass < ThetvdbApi::Base
end

describe ThetvdbApi::Base do
  let(:klass) { ExampleClass }
  let(:model) { klass.new(ThetvdbApi::Client.new) }

  describe '.connection' do
    it 'should create instance of Faraday' do
      Faraday.should_receive(:new).with(url: 'http://thetvdb.com/api/')

      model.connection
    end

    it 'should use adapter from configuration' do
      ThetvdbApi::Configuration.stub(:adapter).and_return(:test)
      ThetvdbApi::Configuration.should_receive(:adapter)

      model.connection
    end
  end

  describe '.get' do
    it 'should set @uri_template' do
      model.get('http://example.com')

      model.instance_variable_get('@uri_template').class.should == URITemplate::RFC6570
    end

    it 'should return self' do
      model.get('http://example.com').should == model
    end
  end

  describe '.params' do
    it 'should set @params' do
      model.params(sample: 'test')

      model.instance_variable_get('@params').should == { language: 'en', sample: 'test' }
    end

    it 'should return self' do
      model.params(sample: 'test').should == model
    end
  end

  describe '.response' do
    it 'should raise error when @uri_template is not filled' do
      -> { model.response }.should raise_error
    end

    it 'should call get klass method' do
      model.instance_variable_set('@uri_template', URITemplate.new('{api_key}/series/{id}'))
      model.stub(:connection).and_return(double(get: true))
      model.connection.should_receive(:get)

      model.response
    end
  end

  describe '.prepare_uri' do
    it 'should receive correct uri string' do
      model.instance_variable_set('@uri_template', URITemplate.new('{api_key}/series/{id}'))

      model.prepare_uri.should == "#{model.api_key}/series/"
    end
  end

  describe '.url' do
    it 'should receive correct string' do
      model.stub(:base_url).and_return('BASE_URL/')
      model.stub(:uri).and_return('URI')

      model.url.should == 'BASE_URL/URI'
    end
  end

  describe '.uri' do
    it 'should receive correct uri string' do
      model.instance_variable_set('@uri_template', URITemplate.new('{api_key}/series/{id}'))
      model.instance_variable_set('@params', id: '1234')

      model.uri.should == "#{model.api_key}/series/1234"
    end
  end

  describe '.restful_param_keys' do
    it 'should receive correct uri string' do
      uri_template = URITemplate.new('{api_key}/series/{id}')
      model.instance_variable_set('@uri_template', uri_template)

      model.restful_param_keys(uri_template.expand).sort.should == ['api_key', 'id'].sort
    end
  end

  describe '.series_uri' do
    it 'should use default api_key' do
      klass.new(ThetvdbApi::Client.new(api_key: 'API_KEY')).series_uri.should == '{api_key}/series/{series_id}'
    end
  end

  describe '.language' do
    it 'should use default language' do
      klass.new(ThetvdbApi::Client.new).language.should == 'en'
    end

    it 'should set language' do
      klass.new(ThetvdbApi::Client.new(language: 'LANGUAGE')).language.should == 'LANGUAGE'
    end
  end

  describe '.api_key' do
    it 'should use default api_key' do
      klass.new(ThetvdbApi::Client.new).api_key.should == ThetvdbApi::Configuration.api_key
    end

    it 'should set api_Key' do
      klass.new(ThetvdbApi::Client.new(api_key: 'API_KEY')).api_key.should == 'API_KEY'
    end
  end
end
