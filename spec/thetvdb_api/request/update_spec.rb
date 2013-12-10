require 'spec_helper'

describe ThetvdbApi::Request::Update do
  let(:klass) { ThetvdbApi::Request::Update }
  let(:model) { klass.new('period') }

  describe '#day' do
    it 'should call new with specific params' do
      klass.should_receive(:new).with(:day)

      klass.day
    end
  end

  describe '#week' do
    it 'should call new with specific params' do
      klass.should_receive(:new).with(:week)

      klass.week
    end
  end

  describe '#month' do
    it 'should call new with specific params' do
      klass.should_receive(:new).with(:month)

      klass.month
    end
  end

  describe '#all' do
    it 'should call new with specific params' do
      klass.should_receive(:new).with(:all)

      klass.all
    end
  end

  describe '#uri' do
    it 'should return correct path' do
      ThetvdbApi::Configuration.stub(:api_key).and_return('API_KEY')

      model.uri.should == 'API_KEY/updates/updates_period.xml'
    end
  end

  describe '#series_response' do
    it 'should call collection_response method' do
      model.should_receive(:collection_response).with('Series')

      model.series_response
    end
  end

  describe '#episodes_response' do
    it 'should call collection_response method' do
      model.should_receive(:collection_response).with('Episode')

      model.episodes_response
    end
  end

  describe '#banners_response' do
    it 'should call collection_response method' do
      model.should_receive(:collection_response).with('Banner')

      model.banners_response
    end
  end

  describe '#result' do
    it 'should return correct keys' do
      model.result.keys.sort.should == [:series, :episodes, :banners].sort
    end
  end
end
