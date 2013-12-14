require 'spec_helper'

describe ThetvdbApi::Search do
  let(:model) { ThetvdbApi::Search.new(ThetvdbApi::Client.new) }

  describe 'real request' do
    describe '.get_series' do
      it 'should return response class' do
        model.get_series('buffy').class.should == HTTParty::Response
      end
    end

    describe '.get_series_by_imdb_id' do
      it 'should return response class' do
        model.get_series_by_imdb_id('tt0118276').class.should == HTTParty::Response
      end
    end

    describe '.get_series_by_zap2it_id' do
      it 'should return response class' do
        model.get_series_by_zap2it_id('EP00213110').class.should == HTTParty::Response
      end
    end

    describe '.get_episode_by_air_date' do
      it 'should return response class' do
        model.get_episode_by_air_date('70327','1997-03-10').class.should == HTTParty::Response
      end
    end
  end
end
