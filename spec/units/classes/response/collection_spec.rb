require 'units/unit_spec_helper'

class ExampleResponseClass
  include ThetvdbApi::Response::Collection
end

describe ThetvdbApi::Response::Collection do
  let(:klass) { ExampleResponseClass }
  let(:model) { klass.new }
  let(:faraday_response) { double(env: true, status: true, headers: true, body: 'TEST') }

  describe '.body' do
    describe 'with mapping' do
      it 'should return array when parse return array' do
        model.instance_variable_set('@mapping', true)
        model.stub(:parse).and_return([])

        model.body.class.should == Array
      end

      it 'should return array when parse return hash' do
        model.instance_variable_set('@mapping', true)
        model.stub(:parse).and_return({})

        model.body.class.should == Array
      end
    end

    describe 'without mapping' do
      it 'should return faraday response' do
        model.instance_variable_set('@mapping', false)
        model.instance_variable_set('@faraday_response', faraday_response)

        model.body.should == 'TEST'
      end
    end
  end
end
