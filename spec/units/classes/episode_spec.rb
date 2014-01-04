require 'units/unit_spec_helper'

describe ThetvdbApi::Episode do
  let(:klass) { ThetvdbApi::Episode }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }

  describe '.find_by_default_order' do
    it 'should call find_by_order with specific params' do
      model.should_receive(:find_by_order).with('default', '1234', '1', '1', {})

      model.find_by_default_order('1234', '1', '1')
    end
  end

  describe '.find_by_default_order_url' do
    it 'should call find_by_order with specific params' do
      model.should_receive(:find_by_order_url).with('default', '1234', '1', '1', {})

      model.find_by_default_order_url('1234', '1', '1')
    end
  end

  describe '.find_by_dvd_order' do
    it 'should call find_by_order with specific params' do
      model.should_receive(:find_by_order).with('dvd', '1234', '1', '1', {})

      model.find_by_dvd_order('1234', '1', '1')
    end
  end

  describe '.find_by_dvd_order_url' do
    it 'should call find_by_order with specific params' do
      model.should_receive(:find_by_order_url).with('dvd', '1234', '1', '1', {})

      model.find_by_dvd_order_url('1234', '1', '1')
    end
  end

  describe '.find_by_absolute_order' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:find_by_absolute_order_get_with_params).with('1234', '1', {}).and_return(double(response: true))

      model.find_by_absolute_order('1234', '1')
    end

    it 'should call response with specific arguments' do
      model.should_receive(:response).with(ThetvdbApi::Response::Episode)

      model.find_by_absolute_order('1234', '1')
    end
  end

  describe '.find_by_absolute_order_url' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:find_by_absolute_order_get_with_params).with('1234', '1', {}).and_return(double(url: true))

      model.find_by_absolute_order_url('1234', '1')
    end

    it 'should call url' do
      model.should_receive(:url)

      model.find_by_absolute_order_url('1234', '1')
    end
  end

  describe '.find_by_absolute_order_get_with_params' do
    it 'should call get with specific arguments' do
      model.stub(:find_by_absolute_order_path).and_return('PATH')
      model.should_receive(:get).with('PATH').and_return(double(params: true))

      model.find_by_absolute_order_get_with_params('1234', '1', {})
    end

    it 'should call params with specific arguments' do
      model.should_receive(:params).with(series_id: '1234', absolute: '1')

      model.find_by_absolute_order_get_with_params('1234', '1', {})
    end
  end

  describe '.find' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:find_get_with_params).with('1234', {}).and_return(double(response: true))

      model.find('1234')
    end

    it 'should call response with specific arguments' do
      model.should_receive(:response).with(ThetvdbApi::Response::Episode)

      model.find('1234')
    end
  end

  describe '.find_url' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:find_get_with_params).with('1234', {}).and_return(double(url: true))

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

      model.find_get_with_params('1234', {})
    end

    it 'should call params with specific arguments' do
      model.should_receive(:params).with(episode_id: '1234')

      model.find_get_with_params('1234', {})
    end
  end

  describe '.find_by_order' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:find_by_order_get_with_params).with('default', '1234', '1', '1', {}).and_return(double(response: true))

      model.find_by_order('default', '1234', '1', '1', {})
    end

    it 'should call response with specific arguments' do
      model.should_receive(:response).with(ThetvdbApi::Response::Episode)

      model.find_by_order('default', '1234', '1', '1', {})
    end
  end

  describe '.find_by_order_url' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:find_by_order_get_with_params).with('default', '1234', '1', '1', {}).and_return(double(url: true))

      model.find_by_order_url('default', '1234', '1', '1', {})
    end

    it 'should call url' do
      model.should_receive(:url)

      model.find_by_order_url('default', '1234', '1', '1', {})
    end
  end

  describe '.find_by_order_get_with_params' do
    it 'should call get with specific arguments' do
      model.stub(:find_by_order_path).and_return('PATH')
      model.should_receive(:get).with('PATH').and_return(double(params: true))

      model.find_by_order_get_with_params('default', '1234', '1', '1', {})
    end

    it 'should call params with specific arguments' do
      model.should_receive(:params).with(series_id: '1234', season: '1', episode: '1', order: 'default')

      model.find_by_order_get_with_params('default', '1234', '1', '1', {})
    end
  end
end
