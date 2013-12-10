require 'spec_helper'

describe ThetvdbApi::Episode do
  let(:model) { ThetvdbApi::Episode.new(ThetvdbApi::Client.new) }

  describe 'real request' do
    describe '.find_by_default_order' do
      it 'should return hash' do
        model.find_by_default_order('70327', '1', '1').class.should == Hash
      end
    end

    describe '.find_by_dvd_order' do
      it 'should return hash' do
        model.find_by_dvd_order('70327', '1', '1').class.should == Hash
      end
    end

    describe '.find_by_absolute_order' do
      it 'should return hash' do
        model.find_by_absolute_order('70327', '1').class.should == Hash
      end
    end

    describe '.find' do
      it 'should return hash' do
        model.find('533011').class.should == Hash
      end
    end
  end
end
