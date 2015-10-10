require 'spec_helper'

describe GyomuRuby::MasterData::FormBuilderHelper do
  include GyomuRuby::MasterData::FormHelper

  let(:fake_builder) { Object.new.extend(GyomuRuby::MasterData::FormBuilderHelper) }

  describe '#prefecture_select' do
    it 'calls :select with choices for prefectures' do
      expect(fake_builder).to receive(:select).with(:attr_name, options_for_prefecture_select, {}, {}).and_return(true)

      fake_builder.prefecture_select(:attr_name)
    end
  end

  describe '#currency_select' do
    it 'calls :select with choices for currencies' do
      expect(fake_builder).to receive(:select).with(:attr_name, options_for_currency_select, {}, {}).and_return(true)

      fake_builder.currency_select(:attr_name)
    end
  end
end
