# -*- coding: utf-8 -*-
require 'spec_helper'

module GyomuRuby
  describe AddressFormatter do
    let(:described_module) { described_class }

    describe '.format_zipcode' do
      context 'when 7 digit number' do
        subject { described_module.format_zipcode('1234567') }
        it { should == '123-4567' }
      end

      context 'when 3 digit and 4 digit number separated by hyphen' do
        subject { described_module.format_zipcode('234-5678') }
        it { should == '234-5678' }
      end

      context 'when 7 digit number in Zenkaku' do
        subject { described_module.format_zipcode('３４５６７８９') }
        it { should == '345-6789' }
      end

      context 'when 3 digit and 4 digit number separated by hyphen in Zenkaku' do
        subject { described_module.format_zipcode('４５６−７８９０') }
        it { should == '456-7890' }
      end

      context 'when passed blank' do
        context 'with empty string' do
          subject { described_module.format_zipcode('') }
          it { should == '' }
        end

        context 'with nil' do
          subject { described_module.format_zipcode(nil) }
          it { should == '' }
        end

        context 'with  whitespace' do
          subject { described_module.format_zipcode(' ') }
          it { should == '' }
        end

        context 'with whitespaces' do
          subject { described_module.format_zipcode(' ' * 4) }
          it { should == '' }
        end

        context 'specified blank character' do
          subject { described_module.format_zipcode('', '***') }
          it { should == '***'}
        end
      end
    end
  end
end
