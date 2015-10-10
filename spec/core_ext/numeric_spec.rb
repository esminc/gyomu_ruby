require 'spec_helper'
require 'gyomu_ruby/core_ext/numeric'

describe Numeric, 'gyomu_ruby extentions' do
  describe '#round_up' do
    it { expect(101.round_up(50)).to eq(150) }
    it { expect(151.round_up(50)).to eq(200) }
    it { expect(123.round_up(3)).to eq(123) }
    it { expect(10.1.round_up(2)).to eq(12) }
  end

  describe '#round_down' do
    it { expect(101.round_down(50)).to eq(100) }
    it { expect(151.round_down(50)).to eq(150) }
    it { expect(123.round_down(3)).to eq(123) }
    it { expect(10.1.round_down(2)).to eq(10) }
  end
end
