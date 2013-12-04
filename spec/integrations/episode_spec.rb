require 'spec_helper'

describe ThetvdbApi::Request::Episode do
  let(:klass) { ThetvdbApi::Request::Episode }

  describe 'real request' do
    describe '#find_by_default_order' do
      it 'should return series class' do
        klass.find_by_default_order('70327', '1', '1').result.class.should == ThetvdbApi::Episode
      end
    end

    describe '#find_by_dvd_order' do
      it 'should return series and episodes' do
        klass.find_by_dvd_order('70327', '1', '1').result.class.should == ThetvdbApi::Episode
      end
    end

    describe '#find_by_absolute_order' do
      it 'should return series and episodes' do
        klass.find_by_absolute_order('70327', '1').result.class.should == ThetvdbApi::Episode
      end
    end

    describe '#find' do
      it 'should return series and episodes' do
        klass.find('533011').result.class.should == ThetvdbApi::Episode
      end
    end
  end
end
