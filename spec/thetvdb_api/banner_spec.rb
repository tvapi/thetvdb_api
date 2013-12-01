require 'spec_helper'

describe ThetvdbApi::Banner do
  let(:klass) { ThetvdbApi::Banner }

  shared_examples 'integer mapping' do |field|
    it 'should save as Integer' do
      klass.new(field => '123').send(field).should == 123
    end
  end

  shared_examples 'float mapping' do |field|
    it 'should save as Integer' do
      klass.new(field => '12.3').send(field).should == 12.3
    end
  end

  describe 'ceorce' do
    describe 'rating attribute' do
      include_examples 'float mapping', :rating
    end

    describe 'rating_count attribute' do
      include_examples 'integer mapping', :rating_count
    end
  end
end
