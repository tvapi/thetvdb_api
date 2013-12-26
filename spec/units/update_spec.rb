require 'spec_helper'

describe ThetvdbApi::Update do
  let(:klass) { ThetvdbApi::Update }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }

  describe '.day' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:day_get_with_params).with({}).and_return(double(response: true))

      model.day
    end

    it 'should call response with specific arguments' do
      model.should_receive(:response).with(ThetvdbApi::Response::Update)

      model.day
    end
  end

  describe '.day_url' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:day_get_with_params).and_return(double(url: true))

      model.day_url
    end

    it 'should call url' do
      model.should_receive(:url)

      model.day_url
    end
  end

  describe '.day_get_with_params' do
    it 'should call get with specific arguments' do
      model.stub(:day_path).and_return('PATH')
      model.should_receive(:get).with('PATH').and_return(double(params: true))

      model.day_get_with_params
    end

    it 'should call params with specific arguments' do
      model.should_receive(:params).with({})

      model.day_get_with_params
    end
  end

  describe '.week' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:week_get_with_params).with({}).and_return(double(response: true))

      model.week
    end

    it 'should call response with specific arguments' do
      model.should_receive(:response).with(ThetvdbApi::Response::Update)

      model.week
    end
  end

  describe '.week_url' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:week_get_with_params).and_return(double(url: true))

      model.week_url
    end

    it 'should call url' do
      model.should_receive(:url)

      model.week_url
    end
  end

  describe '.week_get_with_params' do
    it 'should call get with specific arguments' do
      model.stub(:week_path).and_return('PATH')
      model.should_receive(:get).with('PATH').and_return(double(params: true))

      model.week_get_with_params
    end

    it 'should call params with specific arguments' do
      model.should_receive(:params).with({})

      model.week_get_with_params
    end
  end

  describe '.month' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:month_get_with_params).with({}).and_return(double(response: true))

      model.month
    end

    it 'should call response with specific arguments' do
      model.should_receive(:response).with(ThetvdbApi::Response::Update)

      model.month
    end
  end

  describe '.month_url' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:month_get_with_params).and_return(double(url: true))

      model.month_url
    end

    it 'should call url' do
      model.should_receive(:url)

      model.month_url
    end
  end

  describe '.month_get_with_params' do
    it 'should call get with specific arguments' do
      model.stub(:month_path).and_return('PATH')
      model.should_receive(:get).with('PATH').and_return(double(params: true))

      model.month_get_with_params
    end

    it 'should call params with specific arguments' do
      model.should_receive(:params).with({})

      model.month_get_with_params
    end
  end

  describe '.all' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:all_get_with_params).with({}).and_return(double(response: true))

      model.all
    end

    it 'should call response with specific arguments' do
      model.should_receive(:response).with(ThetvdbApi::Response::Update)

      model.all
    end
  end

  describe '.all_url' do
    it 'should call find_get_with_params with specific arguments' do
      model.should_receive(:all_get_with_params).and_return(double(url: true))

      model.all_url
    end

    it 'should call url' do
      model.should_receive(:url)

      model.all_url
    end
  end

  describe '.all_get_with_params' do
    it 'should call get with specific arguments' do
      model.stub(:all_path).and_return('PATH')
      model.should_receive(:get).with('PATH').and_return(double(params: true))

      model.all_get_with_params
    end

    it 'should call params with specific arguments' do
      model.should_receive(:params).with({})

      model.all_get_with_params
    end
  end
end
