# coding: utf-8
require 'active_support/core_ext'
require 'active_support/deprecation'
require 'gyomu_ruby/address_formatter'
require 'moji'

require 'gyomu_ruby/deprecation'

module GyomuRuby
  module OrdinarySystemDevelopment
    module AddressFormatter
      module_function

      def format_zipcode(zipcode_string, blank = '')
        GyomuRuby::Deprecation.deprecated_method_warning(:format_zipcode, "use GyomuRuby::AddressFormatter.format_zipcode instead")
        GyomuRuby::AddressFormatter.format_zipcode(zipcode_string, blank)
      end

      def format_tel_no(telno_numeric_string, blank = '')
        GyomuRuby::Deprecation.deprecated_method_warning(:format_tel_no, "use GyomuRuby::AddressFormatter.format_tel_no instead")
        GyomuRuby::AddressFormatter.format_tel_no(telno_numeric_string, blank)
      end

      def prefecture_name(prefecture_code, blank = '')
        GyomuRuby::Deprecation.deprecated_method_warning(:prefecture_code, "use GyomuRuby::AddressFormatter.format_prefecture_name instead")
        GyomuRuby::AddressFormatter.prefecture_name(prefecture_code, blank)
      end

    end
  end
end
