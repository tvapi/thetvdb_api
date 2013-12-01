require 'spec_helper'

describe ThetvdbApi::Series do
  let(:klass) { ThetvdbApi::Series }

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

  shared_examples 'date mapping' do |field|
    it 'should save as Date' do
      klass.new(field => '2000-01-01').send(field).should == Date.new(2000, 1, 1)
    end
  end

  shared_examples 'time mapping' do |field|
    it 'should save as Time' do
      time = Time.now
      klass.new(field => time.to_i.to_s).send(field).to_i.should == time.to_i
    end
  end

  shared_examples 'array mapping' do |field|
    it 'should save as Array' do
      klass.new(field => '|John|Joe').send(field).should == ['John', 'Joe']
    end
  end

  describe 'key mapping' do
    describe 'lastupdated attribute' do
      include_examples 'mapping', :lastupdated, :last_updated_at
    end

    describe 'seriesid attribute' do
      include_examples 'mapping', :seriesid, :series_id
    end
  end

  describe 'ceorce' do
    describe 'id attribute' do
      include_examples 'integer mapping', :id
    end

    describe 'actors attribute' do
      include_examples 'array mapping', :actors
    end

    describe 'added_at attribute' do
      include_examples 'time mapping', :added_at
    end

    describe 'added_by attribute' do
      include_examples 'integer mapping', :added_by
    end

    describe 'alias_names attribute' do
      include_examples 'array mapping', :alias_names
    end

    describe 'first_aired attribute' do
      include_examples 'date mapping', :first_aired
    end

    describe 'genre attribute' do
      include_examples 'array mapping', :genre
    end

    describe 'last_updated_at attribute' do
      include_examples 'time mapping', :last_updated_at
    end

    describe 'network_id attribute' do
      include_examples 'integer mapping', :network_id
    end

    describe 'rating attribute' do
      include_examples 'float mapping', :rating
    end

    describe 'rating_count attribute' do
      include_examples 'integer mapping', :rating_count
    end

    describe 'runtime attribute' do
      include_examples 'integer mapping', :runtime
    end

    describe 'series_id attribute' do
      include_examples 'integer mapping', :series_id
    end
  end
end
