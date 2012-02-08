require 'spec_helper'
require 'gyomu_ruby/core_ext/numeric'

describe Numeric, 'gyomu_ruby extentions' do
  describe '#roundup' do
    it { 101.roundup(50).should == 150 }
    it { 151.roundup(50).should == 200 }
    it { 123.roundup(3).should == 123 }
    it { 10.1.roundup(2).should == 12 }
  end

  describe '#rounddown' do
    it { 101.rounddown(50).should == 100 }
    it { 151.rounddown(50).should == 150 }
    it { 123.rounddown(3).should == 123 }
    it { 10.1.rounddown(2).should == 10 }
  end
end
