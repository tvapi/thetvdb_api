require 'spec_helper'

describe ThetvdbApi::Request::Search do
  let(:klass) { ThetvdbApi::Request::Search }

  describe 'real request' do
    describe '#get_series' do
      it 'should return array' do
        klass.get_series('buffy').result.class.should == Array
      end
    end

    describe '#get_series_by_imdb_id' do
      it 'should return series class' do
        klass.get_series_by_imdb_id('tt0118276').result.class.should == Hash
      end
    end

    describe '#get_series_by_zap2it_id' do
      it 'should return series class' do
        klass.get_series_by_zap2it_id('EP00213110').result.class.should == Hash
      end
    end

    describe '#get_episode_by_air_date' do
      it 'should return episode class' do
        klass.get_episode_by_air_date('70327','1997-03-10').result.class.should == Hash
      end
    end
  end
end
