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

  describe '.day_url' do
    it 'should return correct string' do
      model.day_url.should == "http://thetvdb.com/api/#{model.api_key}/updates/updates_day.xml"
    end
  end

  describe '.week' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/updates/updates_week.xml').and_return(mock_model)

      model.week
    end
  end

  describe '.week_url' do
    it 'should return correct string' do
      model.week_url.should == "http://thetvdb.com/api/#{model.api_key}/updates/updates_week.xml"
    end
  end

  describe '.month' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/updates/updates_month.xml').and_return(mock_model)

      model.month
    end
  end

  describe '.month_url' do
    it 'should return correct string' do
      model.month_url.should == "http://thetvdb.com/api/#{model.api_key}/updates/updates_month.xml"
    end
  end

  describe '.all' do
    it 'should call get with specific params' do
      model.should_receive(:get).with('{api_key}/updates/updates_all.xml').and_return(mock_model)

      model.all
    end
  end

  describe '.all_url' do
    it 'should return correct string' do
      model.all_url.should == "http://thetvdb.com/api/#{model.api_key}/updates/updates_all.xml"
    end
  end
end
