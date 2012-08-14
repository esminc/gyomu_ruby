# -*- coding: utf-8 -*-
require 'spec_helper'
require 'gyomu_ruby/ordinary_system_development/address_formatter'

module GyomuRuby
  module OrdinarySystemDevelopment
    describe AddressFormatter do
      let(:described_module) { described_class }

      describe '.format_zipcode' do
        context 'when blank' do
          subject { described_module.format_zipcode('') }
          it { should be_blank }
        end

        context 'when 7 digit number' do
          subject { described_module.format_zipcode('1234567') }
          it { should == '123-4567' }
        end

        context 'when 3 digit and 4 digit number separated by hyphen' do
          subject { described_module.format_zipcode('234-5678') }
          it { should == '234-5678' }
        end
      end

      describe '.format with specified blank character' do
        subject { described_module.format_zipcode('', '***') }
        it { should == '***'}
      end
    end
  end
end
