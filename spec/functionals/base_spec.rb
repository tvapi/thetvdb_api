require 'spec_helper'

class SampleClass < ThetvdbApi::Base; end

describe ThetvdbApi::Base do
  let(:model) { SampleClass.new({}) }

  describe '.normalize_series_id_options' do
    it 'return correct hash with normal attributes' do
      expect(model.normalize_series_id_options(1234)).
        to eq({ series_id: 1234 })
    end

    it 'return correct hash with hash attributes' do
      expect(model.normalize_series_id_options(series_id: 1234)).
        to eq({ series_id: 1234 })
    end
  end

  describe '.normalize_series_id_absolute_options' do
    it 'return correct hash with normal attributes' do
      expect(model.normalize_series_id_absolute_options(1234, 1)).
        to eq({ series_id: 1234, absolute: 1 })
    end

    it 'return correct hash with hash attributes' do
      expect(model.normalize_series_id_absolute_options(series_id: 1234, absolute: 1)).
        to eq({ series_id: 1234, absolute: 1 })
    end
  end

  describe '.normalize_series_id_episode_options' do
    it 'normalize_series_id_episode_options' do
      expect(model.normalize_series_id_episode_options(1234, 1, 2)).
        to eq({ series_id: 1234, season: 1, episode: 2 })
    end

    it 'return correct hash with hash attributes' do
      expect(model.normalize_series_id_episode_options(series_id: 1234, season: 1, episode: 2)).
        to eq({ series_id: 1234, season: 1, episode: 2 })
    end
  end

  describe '.normalize_episode_id_options' do
    it 'return correct hash with normal attributes' do
      expect(model.normalize_episode_id_options(1234)).
        to eq({ episode_id: 1234 })
    end

    it 'return correct hash with hash attributes' do
      expect(model.normalize_episode_id_options(episode_id: 1234)).
        to eq({ episode_id: 1234 })
    end
  end

  describe '.normalize_series_name_options' do
    it 'return correct hash with normal attributes' do
      expect(model.normalize_series_name_options('Buffy')).
        to eq({ seriesname: 'Buffy' })
    end

    it 'return correct hash with hash attributes' do
      expect(model.normalize_series_name_options(name: 'Buffy')).
        to eq({ seriesname: 'Buffy' })
    end
  end

  describe '.normalize_series_id_air_date_options' do
    it 'return correct hash with normal attributes' do
      expect(model.normalize_series_id_air_date_options('1234', '2000-01-01')).
        to eq({ seriesid: '1234', airdate: '2000-01-01' })
    end

    it 'return correct hash with hash attributes' do
      expect(model.normalize_series_id_air_date_options(series_id: '1234', air_date: '2000-01-01')).
        to eq({ seriesid: '1234', airdate: '2000-01-01' })
    end
  end
end
