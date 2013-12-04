require 'spec_helper'

describe ThetvdbApi::Episode do
  let(:klass) { ThetvdbApi::Episode }

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
    describe 'airsafter_season attribute' do
      include_examples 'mapping', :airsafter_season, :airs_after_season
    end

    describe 'airsbefore_episode attribute' do
      include_examples 'mapping', :airsbefore_episode, :airs_before_episode
    end

    describe 'airsbefore_season attribute' do
      include_examples 'mapping', :airsbefore_season, :airs_before_season
    end

    describe 'Combined_episodenumber attribute' do
      include_examples 'mapping', :Combined_episodenumber, :combined_episode_number
    end

    describe 'DVD_discid attribute' do
      include_examples 'mapping', :DVD_discid, :dvd_disc_id
    end

    describe 'DVD_episodenumber attribute' do
      include_examples 'mapping', :DVD_episodenumber, :dvd_episode_number
    end

    describe 'lastupdated attribute' do
      include_examples 'mapping', :lastupdated, :last_updated_at
    end

    describe 'seasonid attribute' do
      include_examples 'mapping', :seasonid, :season_id
    end

    describe 'series attribute' do
      include_examples 'mapping', :series, :series_id
    end

    describe 'seriesid attribute' do
      include_examples 'mapping', :seriesid, :series_id
    end

    describe 'thumb_added attribute' do
      include_examples 'mapping', :thumb_added, :thumb_added_at
    end
  end

  describe 'ceorce' do
    describe 'id attribute' do
      include_examples 'integer mapping', :id
    end

    describe 'absolute_number attribute' do
      include_examples 'integer mapping', :absolute_number
    end

    describe 'combined_episode_number attribute' do
      include_examples 'integer mapping', :combined_episode_number
    end

    describe 'combined_season attribute' do
      include_examples 'integer mapping', :combined_season
    end

    describe 'director attribute' do
      include_examples 'array mapping', :director
    end

    describe 'ep_img_flag attribute' do
      include_examples 'integer mapping', :ep_img_flag
    end

    describe 'episode_number attribute' do
      include_examples 'integer mapping', :episode_number
    end

    describe 'first_aired attribute' do
      include_examples 'date mapping', :first_aired
    end

    describe 'guest_stars attribute' do
      include_examples 'array mapping', :guest_stars
    end

    describe 'last_updated_at attribute' do
      include_examples 'time mapping', :last_updated_at
    end

    describe 'rating attribute' do
      include_examples 'float mapping', :rating
    end

    describe 'rating_count attribute' do
      include_examples 'integer mapping', :rating_count
    end

    describe 'season_id attribute' do
      include_examples 'integer mapping', :season_id
    end

    describe 'season_number attribute' do
      include_examples 'integer mapping', :season_number
    end

    describe 'series_id attribute' do
      include_examples 'integer mapping', :series_id
    end

    describe 'thumb_addedd_at attribute' do
      include_examples 'time mapping', :thumb_added_at
    end

    describe 'thumb_height attribute' do
      include_examples 'integer mapping', :thumb_height
    end

    describe 'thumb_width attribute' do
      include_examples 'integer mapping', :thumb_width
    end

    describe 'time attribute' do
      include_examples 'time mapping', :time
    end

    describe 'writer attribute' do
      include_examples 'array mapping', :writer
    end
  end
end
