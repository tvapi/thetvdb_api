require 'spec_helper'

describe ThetvdbApi::Update do
  let(:klass) { ThetvdbApi::Update }
  let(:model) { klass.new(ThetvdbApi::Client.new(api_key: '123456789')) }
  let(:mock_model) { SampleModel.new }

  describe '.day' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/updates/updates_day.xml').and_return(mock_model)

      model.day
    end
  end

  describe '.week' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/updates/updates_week.xml').and_return(mock_model)

      model.week
    end
  end

  describe '.month' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/updates/updates_month.xml').and_return(mock_model)

      model.month
    end
  end

  describe '.all' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/updates/updates_all.xml').and_return(mock_model)

      model.all
    end
  end
end
