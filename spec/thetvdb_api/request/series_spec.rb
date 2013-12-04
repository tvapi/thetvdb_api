require 'spec_helper'

describe ThetvdbApi::Request::Series do
  let(:klass) { ThetvdbApi::Request::Series }
  let(:result_kind) { :base }
  let(:model) { klass.new('http://example.com', result_kind) }

  describe '#find' do
    it 'should call new with specific params' do
      klass.stub(:find_path).and_return('PATH')
      klass.should_receive(:new).with('PATH', :base)

      klass.find('1234', 'en')
    end
  end

  describe '#find_full' do
    it 'should call new with specific params' do
      klass.stub(:find_full_path).and_return('PATH')
      klass.should_receive(:new).with('PATH', :full)

      klass.find_full('1234', 'en')
    end
  end

  describe '#find_path' do
    it 'should return correct uri' do
      klass.stub(:series_uri).and_return('PATH/')

      klass.find_path('1234', 'en').should == 'PATH/en.xml'
    end
  end

  describe '#find_full_path' do
    it 'should return correct uri' do
      klass.stub(:series_uri).and_return('PATH/')

      klass.find_full_path('1234', 'en').should == 'PATH/all/en.xml'
    end
  end

  describe '#result' do
    describe 'for base result' do
      let(:result_kind) { :base }

      it 'should call series_response method' do
        model.should_receive(:series_response)

        model.result
      end
    end

    describe 'for full result' do
      let(:result_kind) { :full }

      it 'should call full_response method' do
        model.should_receive(:full_response)

        model.result
      end
    end
  end

  describe '#series_response' do
    it 'should call object_response method with specific parameters' do
      model.should_receive(:object_response).with('Series', ThetvdbApi::Series)
      model.series_response
    end
  end

  describe '#episodes_response' do
    it 'should call collection_response method with specific parameters' do
      model.should_receive(:collection_response).with('Episode', ThetvdbApi::Episode)
      model.episodes_response
    end
  end

  describe '#full_response' do
    it 'should return series and episodes keys' do
      model.stub(:series_response)
      model.stub(:episodes_response)

      model.full_response.keys.sort.should == [:series, :episodes].sort
    end
  end
end
