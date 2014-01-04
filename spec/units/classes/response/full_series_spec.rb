require 'units/unit_spec_helper'

describe ThetvdbApi::Response::FullSeries do
  let(:klass) { ThetvdbApi::Response::FullSeries }
  let(:model) { klass.new(faraday_response) }
  let(:faraday_response) { double(env: true, status: true, headers: true, body: 'TEST') }

  describe '.parse' do
    before do
      model.stub(:xml_parse).and_return({ 'Data' => { 'Series' => [], 'Episode' => [] } })
    end

    it 'should call xml_parse' do
      model.should_receive(:xml_parse)

      model.parse
    end

    it 'should call episode_normalize' do
      model.should_receive(:episode_normalize)

      model.parse
    end
  end

  describe '.xml_parse' do
    it 'should return correct data' do
      model.stub(:multi_xml_parse).and_return({ 'Data' => 'FULL SERIES DATA' })

      model.xml_parse.should == 'FULL SERIES DATA'
    end
  end

  describe '.episode_normalize' do
    it 'should call normalize with Episode argument' do
      model.should_receive(:normalize).with('Episode')

      model.episode_normalize
    end
  end

  describe '.normalize' do
    it 'should convert hash to array' do
      model.instance_variable_set('@parse', { 'Episode' => {} })

      model.normalize('Episode')

      model.parse['Episode'].should == [{}]
    end
  end
end
