require 'spec_helper'

describe ThetvdbApi::Banner do
  let(:klass) { ThetvdbApi::Banner }

  shared_examples 'mapping' do |field, field_mapped|
    it "should save as #{field_mapped}" do
      klass.new(field => '123').send(field_mapped).should_not == nil
    end
  end

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

  shared_examples 'time mapping' do |field|
    it 'should save as Time' do
      time = Time.now
      klass.new(field => time.to_i.to_s).send(field).to_i.should == time.to_i
    end
  end

  describe 'key mapping' do
    describe 'Series attribute' do
      include_examples 'mapping', :Series, :series_id
    end
  end

  describe 'ceorce' do
    describe 'id attribute' do
      include_examples 'integer mapping', :id
    end

    describe 'rating attribute' do
      include_examples 'float mapping', :rating
    end

    describe 'rating_count attribute' do
      include_examples 'integer mapping', :rating_count
    end

    describe 'season attribute' do
      include_examples 'integer mapping', :season
    end

    describe 'series_id attribute' do
      include_examples 'integer mapping', :series_id
    end

    describe 'season_num attribute' do
      include_examples 'integer mapping', :season_num
    end

    describe 'time attribute' do
      include_examples 'time mapping', :time
    end
  end
end
