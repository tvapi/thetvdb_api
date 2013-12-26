require 'spec_helper'

describe ThetvdbApi::Response::Update do
  let(:klass) { ThetvdbApi::Response::Update }
  let(:model) { klass.new(faraday_response) }
  let(:faraday_response) { double(env: true, status: true, headers: true, body: 'TEST') }

  describe '.parse' do
    before do
      model.stub(:xml_parse).and_return({ 'Data' => { 'Series' => [], 'Episode' => [], 'Banner' => [] } })
    end

    it 'should call xml_parse' do
      model.should_receive(:xml_parse)

      model.parse
    end

    it 'should call series_normalize' do
      model.should_receive(:series_normalize)

      model.parse
    end

    it 'should call episode_normalize' do
      model.should_receive(:episode_normalize)

      model.parse
    end

    it 'should call banner_normalize' do
      model.should_receive(:banner_normalize)

      model.parse
    end
  end

  describe '.xml_parse' do
    it 'should return correct data' do
      model.stub(:multi_xml_parse).and_return({ 'Data' => 'UPDATE DATA' })

      model.xml_parse.should == 'UPDATE DATA'
    end
  end

  describe '.series_normalize' do
    it 'should call normalize with Series argument' do
      model.should_receive(:normalize).with('Series')

      model.series_normalize
    end
  end

  describe '.episode_normalize' do
    it 'should call normalize with Episode argument' do
      model.should_receive(:normalize).with('Episode')

      model.episode_normalize
    end
  end

  describe '.banner_normalize' do
    it 'should call normalize with Banner argument' do
      model.should_receive(:normalize).with('Banner')

      model.banner_normalize
    end
  end

  describe '.normalize' do
    it 'should convert hash to array' do
      model.instance_variable_set('@parse', { 'Series' => {} })

      model.normalize('Series')

      model.parse['Series'].should == [{}]
    end
  end
end
