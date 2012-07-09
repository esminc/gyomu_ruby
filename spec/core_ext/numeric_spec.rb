require 'spec_helper'
require 'gyomu_ruby/core_ext/numeric'

describe Numeric, 'gyomu_ruby extentions' do
  describe '#round_up' do
    it { 101.round_up(50).should == 150 }
    it { 151.round_up(50).should == 200 }
    it { 123.round_up(3).should == 123 }
    it { 10.1.round_up(2).should == 12 }
  end

  describe '#round_down' do
    it { 101.round_down(50).should == 100 }
    it { 151.round_down(50).should == 150 }
    it { 123.round_down(3).should == 123 }
    it { 10.1.round_down(2).should == 10 }
  end
end
