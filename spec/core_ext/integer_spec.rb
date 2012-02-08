require 'spec_helper'
require 'gyomu_ruby/core_ext/integer'

describe Integer, 'gyomu_ruby extentions' do
  describe '#ceil' do
    it { 101.ceil(50).should == 150 }
    it { 151.ceil(50).should == 200 }
    it { 121.ceil(3).should == 123 }
    it { 123.ceil(3).should == 123 }
  end

  describe '#floor' do
    it { 101.floor(50).should == 100 }
    it { 151.floor(50).should == 150 }
    it { 121.floor(3).should == 120 }
    it { 123.floor(3).should == 123 }
  end
end
