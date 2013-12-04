require 'spec_helper'

describe ThetvdbApi::Request::Episode do
  let(:klass) { ThetvdbApi::Request::Episode }
  let(:model) { klass.new('http://example.com') }

  describe '#find_by_default_order' do
    it 'should call new with specific params' do
      klass.stub(:find_by_default_order_path).and_return('PATH')
      klass.should_receive(:new).with('PATH')

      klass.find_by_default_order('1234', '1', '1')
    end
  end

  describe '#find_by_dvd_order' do
    it 'should call new with specific params' do
      klass.stub(:find_by_dvd_order_path).and_return('PATH')
      klass.should_receive(:new).with('PATH')

      klass.find_by_dvd_order('1234', '1', '1')
    end
  end

  describe '#find_by_absolute_order' do
    it 'should call new with specific params' do
      klass.stub(:find_by_absolute_order_path).and_return('PATH')
      klass.should_receive(:new).with('PATH')

      klass.find_by_absolute_order('1234', '1')
    end
  end

  describe '#find' do
    it 'should call new with specific params' do
      klass.stub(:find_path).and_return('PATH')
      klass.should_receive(:new).with('PATH')

      klass.find('1234')
    end
  end

  describe '#path_prefix' do
    it 'should return correct uri' do
      ThetvdbApi::Configuration.stub(:api_key).and_return('API_KEY')

      klass.path_prefix('1234').should == 'API_KEY/series/1234/'
    end
  end

  describe '#find_by_default_order_path' do
    it 'should return correct uri' do
      klass.stub(:path_prefix).and_return('PATH/')

      klass.find_by_default_order_path('1234', '1', '1', 'en').should == 'PATH/default/1/1/en.xml'
    end
  end

  describe '#find_by_dvd_order_path' do
    it 'should return correct uri' do
      klass.stub(:path_prefix).and_return('PATH/')

      klass.find_by_dvd_order_path('1234', '1', '1', 'en').should == 'PATH/dvd/1/1/en.xml'
    end
  end

  describe '#find_by_absolute_order_path' do
    it 'should return correct uri' do
      klass.stub(:path_prefix).and_return('PATH/')

      klass.find_by_absolute_order_path('1234', '1', 'en').should == 'PATH/absolute/1/en.xml'
    end
  end

  describe '#find_path' do
    it 'should return correct uri' do
      ThetvdbApi::Configuration.stub(:api_key).and_return('API_KEY')

      klass.find_path('1234', 'en').should == 'API_KEY/episodes/1234/en.xml'
    end
  end

  describe '#response' do
    it 'should call get klass method' do
      klass.should_receive(:get)
      model.stub(:request_options).and_return({})

      model.response
    end
  end

  describe '#result' do
    it 'should call object_response method' do
      model.should_receive(:object_response).with('Episode', ThetvdbApi::Episode)

      model.result
    end
  end
end
