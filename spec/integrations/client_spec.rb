require 'spec_helper'

describe ThetvdbApi::Client do
  let(:client) { ThetvdbApi::Client.new }

  describe 'real request' do
    describe '.search' do
      describe '.get_series' do
        it 'should return response class' do
          client.search.get_series('buffy').class.should == Faraday::Response
        end
      end

      describe '.get_series_by_imdb_id' do
        it 'should return response class' do
          client.search.get_series_by_imdb_id('tt0118276').class.should == Faraday::Response
        end
      end

      describe '.get_series_by_zap2it_id' do
        it 'should return response class' do
          client.search.get_series_by_zap2it_id('EP00213110').class.should == Faraday::Response
        end
      end

      describe '.get_episode_by_air_date' do
        it 'should return response class' do
          client.search.get_episode_by_air_date('70327','1997-03-10').class.should == Faraday::Response
        end
      end
    end

    describe '.series' do
      describe '.find' do
        it 'should return response class' do
          client.series.find('70327').class.should == Faraday::Response
        end
      end

      describe '.find_full' do
        it 'should return response class' do
          client.series.find_full('70327').class.should == Faraday::Response
        end
      end
    end

    describe '.actor' do
      describe '.find' do
        it 'should return response class' do
          client.actor.find('70327').class.should == Faraday::Response
        end
      end
    end

    describe '.banner' do
      describe '.find' do
        it 'should return response class' do
          client.banner.find('70327').class.should == Faraday::Response
        end
      end
    end

    describe '.episode' do
      describe '.find_by_default_order' do
        it 'should return response class' do
          client.episode.find_by_default_order('70327', '1', '1').class.should == Faraday::Response
        end
      end

      describe '.find_by_dvd_order' do
        it 'should return response class' do
          client.episode.find_by_dvd_order('70327', '1', '1').class.should == Faraday::Response
        end
      end

      describe '.find_by_absolute_order' do
        it 'should return response class' do
          client.episode.find_by_absolute_order('70327', '1').class.should == Faraday::Response
        end
      end

      describe '.find' do
        it 'should return response class' do
          client.episode.find('533011').class.should == Faraday::Response
        end
      end
    end

    describe '.update' do
      describe '.day' do
        it 'should return response class' do
          client.update.day.class.should == Faraday::Response
        end
      end

      describe '.week' do
        it 'should return response class' do
          client.update.week.class.should == Faraday::Response
        end
      end

      describe '.month' do
        it 'should return response class' do
          client.update.month.class.should == Faraday::Response
        end
      end
    end
  end
end
