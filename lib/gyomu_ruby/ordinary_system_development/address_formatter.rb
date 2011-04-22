# coding: utf-8
module GyomuRuby
  module OrdinarySystemDevelopment
    module AddressFormatter
      PREFS = File.read(
        File.expand_path('../../../config/prefectures.csv', File.dirname(__FILE__))
      ).lines.map(&:strip).freeze

      ext_tel_numbers = File.read(
        File.expand_path('../../../config/ext_tel_numbers.csv', File.dirname(__FILE__))
      ).lines.map{|n| "0#{n.strip}" }

      EXT_TEL_NUMBERS = (ext_tel_numbers + %w[050 070 080 090 0120]).sort.reverse.freeze
      EXT_TEL_NUMBERS_RE = /\A(#{EXT_TEL_NUMBERS.sort.reverse.join('|')})/uo

      module_function

      def format_zipcode(zipcode_string, blank = '')
        return blank if zipcode_string.blank?
        zipcode_string.sub(/\A(\d{3})(\d{4})\Z/){ "#{$1}-#{$2}" }
      end

      def format_tel_no(telno_numeric_string, blank = '')
        return blank if telno_numeric_string.blank?
        telno_numeric_string.to_s.
          sub(EXT_TEL_NUMBERS_RE){ "#{$1}-" }.
          sub(/(\d{4})\Z/) { "-#{$1}" }
      end

      def prefecture_name(prefecture_code, blank = '')
        return blank if prefecture_code.blank?
        PREFS[prefecture_code.to_i - 1]
      end
    end
  end
end
