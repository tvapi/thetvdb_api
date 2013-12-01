require 'spec_helper'

describe ThetvdbApi::Actor do
  let(:klass) { ThetvdbApi::Actor }

  shared_examples 'integer mapping' do |field|
    it 'should save as Integer' do
      klass.new(field => '123').send(field).should == 123
    end
  end

  describe 'ceorce' do
    describe 'id attribute' do
      include_examples 'integer mapping', :id
    end

    describe 'sort_order attribute' do
      include_examples 'integer mapping', :sort_order
    end
  end
end
