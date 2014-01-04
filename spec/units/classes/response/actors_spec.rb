require 'units/unit_spec_helper'

describe ThetvdbApi::Response::Actors do
  let(:klass) { ThetvdbApi::Response::Actors }
  let(:model) { klass.new(faraday_response) }
  let(:faraday_response) { double(env: true, status: true, headers: true, body: 'TEST') }

  describe '.xml_parse' do
    it 'should return correct data' do
      model.stub(:multi_xml_parse).and_return({ 'Actors' => { 'Actor' => 'ACTOR DATA' } })

      model.xml_parse.should == 'ACTOR DATA'
    end
  end
end
