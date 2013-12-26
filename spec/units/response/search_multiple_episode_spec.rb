require 'spec_helper'

describe ThetvdbApi::Response::SearchMultipleEpisode do
  let(:klass) { ThetvdbApi::Response::SearchMultipleEpisode }
  let(:model) { klass.new(faraday_response) }
  let(:faraday_response) { double(env: true, status: true, headers: true, body: 'TEST') }

  describe '.xml_parse' do
    it 'should return correct data' do
      model.stub(:multi_xml_parse).and_return({ 'Data' => { 'Episode' => 'EPISODE DATA' } })

      model.xml_parse.should == 'EPISODE DATA'
    end
  end
end
