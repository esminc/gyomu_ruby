require 'spec_helper'
require 'gyomu_ruby/core_ext/time'

describe Time, 'gyomu_ruby extentions' do
  describe '#biz_year' do
    context 'default boundary' do
      specify { expect(Time.local(2011, 4, 1).biz_year).to eq(2011) }
      specify { expect(Time.local(2011,12,31).biz_year).to eq(2011) }
      specify { expect(Time.local(2012, 1, 1).biz_year).to eq(2011) }
      specify { expect(Time.local(2012, 3,31).biz_year).to eq(2011) }
    end

    context 'custom boundary at 4/2' do
      specify { expect(Time.local(2011, 4, 1).biz_year(4, 2)).to eq(2010) }
      specify { expect(Time.local(2011, 4, 2).biz_year(4, 2)).to eq(2011) }
    end

    context 'custom boundary at 3/31' do
      specify { expect(Time.local(2011, 3,30).biz_year(3, 31)).to eq(2010) }
      specify { expect(Time.local(2011, 3,31).biz_year(3, 31)).to eq(2011) }
      specify { expect(Time.local(2011, 4, 1).biz_year(3, 31)).to eq(2011) }
    end
  end
end
