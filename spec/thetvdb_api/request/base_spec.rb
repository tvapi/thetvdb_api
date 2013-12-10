require 'spec_helper'

class ExampleRequestClass < ThetvdbApi::Request::Base
end

describe ThetvdbApi::Request::Base do
  let(:klass) { ExampleRequestClass }
  let(:model) { klass.new('test') }

  describe '#api_key' do
    it 'should call api_key from configuration' do
      ThetvdbApi::Configuration.should_receive(:api_key)

      klass.api_key
    end
  end

  describe '#response' do
    it 'should call get klass method' do
      klass.should_receive(:get)
      model.stub(:request_options).and_return({})

      model.response
    end
  end

  describe '#request_options' do
    it 'should return correct keys' do
      model.request_options({}).keys.sort.should == [:query, :base_uri].sort
    end
  end

  describe '#collection_response' do
    it 'should return filled array when condition is true' do
      model.stub(:response_condition?).and_return(true)
      model.stub(:array_normalize).and_return(['test'])

      model.collection_response('Series').should_not be_empty
    end

    it 'should return empty array when condition is false' do
      model.stub(:response_condition?).and_return(false)

      model.collection_response('Series').should be_empty
    end
  end

  describe '#object_response' do
    it 'should return object when condition is true' do
      model.stub(:response_condition?).and_return(true)
      model.stub_chain(:response, :[]).and_return({})

      model.object_response('Series').should be_nil
    end

    it 'should return nil when condition is false' do
      model.stub(:response_condition?).and_return(false)

      model.object_response('Series').should be_nil
    end
  end

  describe '#response_condition?' do
    it 'should return true when code is 200 and return Data hash' do
      model.stub_chain(:response, :code).and_return 200
      model.stub_chain(:response, :[]).and_return({})

      model.response_condition?.should be_true
    end

    it 'should return false when code is different than 200' do
      model.stub_chain(:response, :code).and_return 400
      model.stub_chain(:response, :[]).and_return({})

      model.response_condition?.should be_false
    end

    it 'should return false when return blank response' do
      model.stub_chain(:response, :code).and_return 200
      model.stub_chain(:response, :[]).and_return('')

      model.response_condition?.should be_false
    end
  end

  describe '#array_normalize' do
    it 'should return Array when dig return Array' do
      model.stub(:dig).and_return(Array)
      model.array_normalize('Series').class.should == Array
    end

    it 'should return Array when dig return Hash' do
      model.stub(:dig).and_return(Hash)
      model.array_normalize('Series').class.should == Array
    end
  end

  describe '#dig' do
    it 'should dig to correct hash' do
      model.stub(:response).and_return({ 'Data' => { 'Series' => 'series value' } })

      model.dig('Series').should == 'series value'
    end
  end

  describe '#data' do
    it 'should return correct value' do
      model.stub(:response).and_return({ 'key' => 'value' })
      model.stub(:data_key).and_return('key')

      model.data.should == 'value'
    end
  end
end
