require 'spec_helper'

describe ThetvdbApi::Episode do
  let(:klass) { ThetvdbApi::Episode }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }

  describe '.find_by_default_order' do
    it 'should call new with specific params' do
      model.should_receive(:get).with('123456789/series/1234/default/1/1/en.xml').and_return(double(response: true))

      model.find_by_default_order('1234', '1', '1')
    end
  end

  describe '.find_by_dvd_order' do
    it 'should call new with specific params' do
      model.should_receive(:get).with('123456789/series/1234/dvd/1/1/en.xml').and_return(double(response: true))

      model.find_by_dvd_order('1234', '1', '1')
    end
  end

  describe '.find_by_absolute_order' do
    it 'should call new with specific params' do
      model.should_receive(:get).with('123456789/series/1234/absolute/1/en.xml').and_return(double(response: true))

      model.find_by_absolute_order('1234', '1')
    end
  end

  describe '.find' do
    it 'should call new with specific params' do
      model.should_receive(:get).with('123456789/episodes/1234/en.xml').and_return(double(response: true))

      model.find('1234')
    end
  end

  describe '.shared_uri_suffix' do
    it 'should return correct staring' do
      model.shared_uri_suffix(1, 2, 'en').should == '/1/2/en.xml'
    end
  end
end
