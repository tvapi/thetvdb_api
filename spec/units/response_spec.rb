require 'spec_helper'

describe ThetvdbApi::Search do
  let(:klass) { ThetvdbApi::Response }
  let(:model) { klass.new(faraday_response) }
  let(:faraday_response) { double(env: true, status: true, headers: true, body: 'TEST') }

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
      model = klass.new(faraday_response, true)
      model.should_receive(:parse)

      model.body
    end

    it 'should return string' do
      model.body.class.should == String
    end
  end

  describe '.inspect' do
    it 'should return correct string' do
      model.stub(:body).and_return('BODY')
      model.inspect.should == '"BODY"'
    end
  end

  describe '[]' do
    it 'should return correct string' do
      model.stub(:parse).and_return({'test' => 'output'})
      model['test'].should == 'output'
    end
  end

  describe '[]=' do
    it 'should return correct string' do
      model.stub(:parse).and_return({'test' => 'output'})
      model['test'] = 'output2'

      model['test'].should == 'output2'
    end
  end

  describe '.each' do
    it 'should call each on parsed value' do
      model.stub(:parse).and_return([])
      model.parse.should_receive(:each)

      model.each {}
    end
  end

  describe '.multi_xml_parse' do
    it 'should call parse on MultiXml' do
      MultiXml.should_receive(:parse)

      model.multi_xml_parse
    end
  end

  describe '.xml_parse' do
    it 'should call parse on MultiXml' do
      model.should_receive(:multi_xml_parse)

      model.xml_parse
    end
  end

  describe '.parse' do
    it 'should call multi_xml_parse' do
      model.should_receive(:multi_xml_parse)

      model.parse
    end
  end
end
