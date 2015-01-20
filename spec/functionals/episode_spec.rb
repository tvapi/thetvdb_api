require 'spec_helper'

describe ThetvdbApi::Episode do
  let(:client) { ThetvdbApi::Client.new(api_key: '123456789', adapter: :test, adapter_options: faraday_stubs) }
  let(:model) { client.episode }

  let(:episode_data) { File.read('spec/fixtures/episode.xml') }

  let(:faraday_stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/api/123456789/series/1234/default/1/1/en.xml') { [200, { content_type: 'xml' }, episode_data] }
      stub.get('/api/123456789/series/1234/default/1/1/de.xml') { [200, { content_type: 'xml' }, episode_data] }
      stub.get('/api/123456789/series/1234/dvd/1/1/en.xml') { [200, { content_type: 'xml' }, episode_data] }
      stub.get('/api/123456789/series/1234/dvd/1/1/de.xml') { [200, { content_type: 'xml' }, episode_data] }
      stub.get('/api/123456789/series/1234/absolute/1/en.xml') { [200, { content_type: 'xml' }, episode_data] }
      stub.get('/api/123456789/series/1234/absolute/1/de.xml') { [200, { content_type: 'xml' }, episode_data] }
      stub.get('/api/123456789/episodes/1234/en.xml') { [200, { content_type: 'xml' }, episode_data] }
      stub.get('/api/123456789/episodes/1234/de.xml') { [200, { content_type: 'xml' }, episode_data] }
    end
  end

  describe '.find_by_default_order' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.find_by_default_order(series_id: 1234, season: 1, episode: 1)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.find_by_default_order(series_id: 1234, season: 1, episode: 1).body).to be_a(Hash)
      end
    end

    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.find_by_default_order(1234, 1, 1)).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.find_by_default_order(1234, 1, 1).body).to be_a(Hash)
        end
      end

      context 'with optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.find_by_default_order(1234, 1, 1, 'de')).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.find_by_default_order(1234, 1, 1, 'de').body).to be_a(Hash)
        end
      end
    end
  end

  describe '.find_by_default_order_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(
          model.find_by_default_order_url(series_id: 1234, season: 1, episode: 1)
        ).to eq('http://thetvdb.com/api/123456789/series/1234/default/1/1/en.xml')
      end
    end

    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.find_by_default_order_url(1234, 1, 1)
          ).to eq('http://thetvdb.com/api/123456789/series/1234/default/1/1/en.xml')
        end
      end

      context 'with optional attribute' do
        it 'should return correct url' do
          expect(
            model.find_by_default_order_url(1234, 1, 1, 'de')
          ).to eq('http://thetvdb.com/api/123456789/series/1234/default/1/1/de.xml')
        end
      end
    end
  end

  describe '.find_by_dvd_order' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.find_by_dvd_order(series_id: 1234, season: 1, episode: 1)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.find_by_dvd_order(series_id: 1234, season: 1, episode: 1).body).to be_a(Hash)
      end
    end

    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.find_by_dvd_order(1234, 1, 1)).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.find_by_dvd_order(1234, 1, 1).body).to be_a(Hash)
        end
      end

      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.find_by_dvd_order(1234, 1, 1, 'de')).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.find_by_dvd_order(1234, 1, 1, 'de').body).to be_a(Hash)
        end
      end
    end
  end

  describe '.find_by_dvd_order_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(
          model.find_by_dvd_order_url(series_id: 1234, season: 1, episode: 1)
        ).to eq('http://thetvdb.com/api/123456789/series/1234/dvd/1/1/en.xml')
      end
    end

    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.find_by_dvd_order_url(1234, 1, 1)
          ).to eq('http://thetvdb.com/api/123456789/series/1234/dvd/1/1/en.xml')
        end
      end

      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.find_by_dvd_order_url(1234, 1, 1, 'de')
          ).to eq('http://thetvdb.com/api/123456789/series/1234/dvd/1/1/de.xml')
        end
      end
    end
  end

  describe '.find_by_absolute_order' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.find_by_absolute_order(series_id: 1234, absolute: 1)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.find_by_absolute_order(series_id: 1234, absolute: 1).body).to be_a(Hash)
      end
    end

    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.find_by_absolute_order(1234, 1)).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.find_by_absolute_order(1234, 1).body).to be_a(Hash)
        end
      end

      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.find_by_absolute_order(1234, 1, 'de')).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.find_by_absolute_order(1234, 1, 'de').body).to be_a(Hash)
        end
      end
    end
  end

  describe '.find_by_absolute_order_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(
          model.find_by_absolute_order_url(series_id: 1234, absolute: 1)
        ).to eq('http://thetvdb.com/api/123456789/series/1234/absolute/1/en.xml')
      end
    end

    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.find_by_absolute_order_url(1234, 1)
          ).to eq('http://thetvdb.com/api/123456789/series/1234/absolute/1/en.xml')
        end
      end

      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.find_by_absolute_order_url(1234, 1, 'de')
          ).to eq('http://thetvdb.com/api/123456789/series/1234/absolute/1/de.xml')
        end
      end
    end
  end

  describe '.find' do
    context 'hash attributes' do
      it 'should return Faraday::Response class' do
        expect(model.find(id: 1234)).to be_a(Faraday::Response)
      end

      it 'should return Hash class for body reponse' do
        expect(model.find(id: 1234).body).to be_a(Hash)
      end
    end

    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.find(1234)).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.find(1234).body).to be_a(Hash)
        end
      end

      context 'without optional attribute' do
        it 'should return Faraday::Response class' do
          expect(model.find(1234, 'de')).to be_a(Faraday::Response)
        end

        it 'should return Hash class for body reponse' do
          expect(model.find(1234, 'de').body).to be_a(Hash)
        end
      end
    end
  end

  describe '.find_url' do
    context 'hash attributes' do
      it 'should return correct url' do
        expect(
          model.find_url(id: 1234)
        ).to eq('http://thetvdb.com/api/123456789/episodes/1234/en.xml')
      end
    end

    context 'normal attributes' do
      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.find_url(1234)
          ).to eq('http://thetvdb.com/api/123456789/episodes/1234/en.xml')
        end
      end

      context 'without optional attribute' do
        it 'should return correct url' do
          expect(
            model.find_url(1234, 'de')
          ).to eq('http://thetvdb.com/api/123456789/episodes/1234/de.xml')
        end
      end
    end
  end
end
