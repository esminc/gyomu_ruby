# -*- coding: utf-8 -*-
require 'spec_helper'

module GyomuRuby
  describe AddressFormatter do
    let(:described_module) { described_class }

    describe '.format_zipcode' do
      context 'when 7 digit number' do
        subject { described_module.format_zipcode('1234567') }
        it { is_expected.to eq('123-4567') }
      end

      context 'when 3 digit and 4 digit number separated by hyphen' do
        subject { described_module.format_zipcode('234-5678') }
        it { is_expected.to eq('234-5678') }
      end

      context 'when 7 digit number in Zenkaku' do
        subject { described_module.format_zipcode('３４５６７８９') }
        it { is_expected.to eq('345-6789') }
      end

      context 'when 3 digit and 4 digit number separated by hyphen in Zenkaku' do
        subject { described_module.format_zipcode('４５６−７８９０') }
        it { is_expected.to eq('456-7890') }
      end

      context 'when passed blank' do
        context 'with empty string' do
          subject { described_module.format_zipcode('') }
          it { is_expected.to eq('') }
        end

        context 'with nil' do
          subject { described_module.format_zipcode(nil) }
          it { is_expected.to eq('') }
        end

        context 'with  whitespace' do
          subject { described_module.format_zipcode(' ') }
          it { is_expected.to eq('') }
        end

        context 'with whitespaces' do
          subject { described_module.format_zipcode(' ' * 4) }
          it { is_expected.to eq('') }
        end

        context 'specified blank character' do
          subject { described_module.format_zipcode('', '***') }
          it { is_expected.to eq('***')}
        end
      end
    end

    describe '.format_tel_no' do
      let(:telno_numeric_string) { '03123456' }

      subject { described_module.format_tel_no(telno_numeric_string) }

      context 'when passed blank' do
        before do
          allow(telno_numeric_string).to receive(:blank?).and_return(true)
        end

        it { is_expected.to eq '' }
      end

      context 'when valid area code' do
        context 'when more than 4 digit number after area code' do
          let(:telno_numeric_string) { '03123456' }
          it { is_expected.to eq '03-12-3456' }
        end

        context 'when 4 digit number after area code' do
          let(:telno_numeric_string) { '031234' }
          it { is_expected.to eq '03--1234' }
        end

        context 'when less than or equal to 4 digit number after area code' do
          let(:telno_numeric_string) { '03123' }
          it { is_expected.to eq '03-123' }
        end
      end

      context 'when invalid area code' do
        context 'when more than 4 digit number' do
          let(:telno_numeric_string) { '00000' }
          it { is_expected.to eq '0-0000' }
        end

        context 'when 4 digit number' do
          let(:telno_numeric_string) { '0000' }
          it { is_expected.to eq '-0000' }
        end

        context 'when less than 4 digit number' do
          let(:telno_numeric_string) { '000' }
          it { is_expected.to eq '000' }
        end
      end
    end
  end
end
