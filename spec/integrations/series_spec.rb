require 'spec_helper'

describe ThetvdbApi::Request::Series do
  let(:klass) { ThetvdbApi::Request::Series }

  describe 'real request' do
    describe '#find' do
      it 'should return series class' do
        klass.find('70327').result.class.should == Hash
      end
    end

    describe '#find_full' do
      it 'should return series and episodes' do
        klass.find_full('70327').result.keys.sort.should == [:series, :episodes].sort
      end
    end
  end
end
