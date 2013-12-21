require 'spec_helper'

describe ThetvdbApi::Search do
  let(:klass) { ThetvdbApi::Response }
  let(:model) { klass.new(faraday_response) }
  let(:faraday_response) { double(env: true, status: true, headers: true, body: 'TEST') }

  describe '.mapper' do
    it 'should set mapper' do
      model = klass.new(faraday_response, 'MAPPER')
      model.mapper.should == 'MAPPER'
    end
  end

  describe '.env' do
    it 'should call env in faraday_response' do
      faraday_response.should_receive(:env)

      model.env
    end
  end

  describe '.status' do
    it 'should call status in faraday_response' do
      faraday_response.should_receive(:status)

      model.status
    end
  end

  describe '.headers' do
    it 'should call headers in faraday_response' do
      faraday_response.should_receive(:headers)

      model.headers
    end
  end

  describe '.body' do
    it 'should map response when give mapper' do
      mapper = double(parse: true)
      model = klass.new(faraday_response, mapper)
      mapper.should_receive(:parse)

      model.body
    end

    it 'should return string' do
      model.body.class.should == String
    end
  end

  describe '.inspect' do
    it 'should return correct string' do
      model.stub(:body).and_return('BODY')
      model.stub(:mapper).and_return('MAPPER')
      model.inspect.should == '<ThetvdbApi::Response body="BODY", mapper="MAPPER">'
    end
  end
end
