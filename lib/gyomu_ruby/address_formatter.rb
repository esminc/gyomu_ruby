# coding: utf-8

require 'active_support/core_ext'
require 'moji'

require 'gyomu_ruby/deprecation'

module GyomuRuby
  module AddressFormatter
    ext_tel_numbers = File.read(
      File.expand_path('../../masters/ext_tel_numbers.csv', File.dirname(__FILE__))
    ).lines.map{|n| "0#{n.strip}" }

    EXT_TEL_NUMBERS = (ext_tel_numbers + %w[050 070 080 090 0120]).sort.reverse.freeze
    EXT_TEL_NUMBERS_RE = /\A(#{EXT_TEL_NUMBERS.sort.reverse.join('|')})/uo

    module_function

    def format_zipcode(zipcode_string, blank = '')
      return blank if zipcode_string.blank?
      zipcode = Moji.zen_to_han(zipcode_string, Moji::NUMBER | Moji::SYMBOL)
      digits_only = zipcode.scan(/\d/)
      [digits_only[0..2], '-', digits_only[3..6]].flatten.join
    end

    def format_tel_no(telno_numeric_string, blank = '')
      return blank if telno_numeric_string.blank?
      telno_numeric_string.to_s.
        sub(EXT_TEL_NUMBERS_RE){ "#{$1}-" }.
        sub(/(\d{4})\Z/) { "-#{$1}" }
    end

    def prefecture_name(prefecture_code, blank = '')
      GyomuRuby::Deprecation.deprecated_method_warning(:prefecture_name, "use GyomuRuby::MasterData.prefecture_name instead")

      return blank if prefecture_code.blank?

      MasterData.prefecture_name(prefecture_code)
    end
  end
end
