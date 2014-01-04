require 'units/unit_spec_helper'

describe ThetvdbApi::Response::SearchSeries do
  let(:klass) { ThetvdbApi::Response::SearchSeries }
  let(:model) { klass.new(faraday_response) }
  let(:faraday_response) { double(env: true, status: true, headers: true, body: 'TEST') }

  describe '.xml_parse' do
    it 'should return correct data' do
      model.stub(:multi_xml_parse).and_return({ 'Data' => { 'Series' => 'SERIES DATA' } })

      model.xml_parse.should == 'SERIES DATA'
    end
  end
end
