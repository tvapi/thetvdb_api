require 'spec_helper'

describe ThetvdbApi::Banner do
  let(:klass) { ThetvdbApi::Banner }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }

  describe '.find' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:find_get_with_params).with('1234', {}).and_return(double(response: true))

      model.find('1234')
    end

    it 'should call response with specific arguments' do
      model.should_receive(:response).with(ThetvdbApi::Response::Banners)

      model.find('1234')
    end
  end

  describe '.find_url' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:find_get_with_params).with('1234').and_return(double(url: true))

      model.find_url('1234')
    end

    it 'should call url' do
      model.should_receive(:url)

      model.find_url('1234')
    end
  end

  describe '.find_get_with_params' do
    it 'should call get with specific arguments' do
      model.stub(:find_path).and_return('PATH')
      model.should_receive(:get).with('PATH').and_return(double(params: true))

      model.find_get_with_params('1234')
    end

    it 'should call params with specific arguments' do
      model.should_receive(:params).with(series_id: '1234')

      model.find_get_with_params('1234')
    end
  end
end
