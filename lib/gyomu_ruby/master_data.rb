# coding: utf-8

module GyomuRuby
  module MasterData
    master_data_dir = File.expand_path('../../masters', File.dirname(__FILE__))

    @@currencies_raw_data  = YAML.load_file(master_data_dir + '/currencies.yml')
    @@prefectures_raw_data = YAML.load_file(master_data_dir + '/prefectures.yml')

    class << self
      def currencies
        @currencies ||= @@currencies_raw_data.each_with_object({}) {|currency, memo| memo[currency[:code]] = currency[:name] }
      end

      def prefectures
        @prefectures ||= @@prefectures_raw_data.each_with_object({}) {|pref, memo| memo[pref[:code]] = pref[:name] }
      end

      def prefecture_areas
        @areas ||=
          @@prefectures_raw_data.group_by {|pref|
            pref[:area]
          }.each.with_object({}) {|(area, prefs), memo|
            memo[area] = prefs.map {|pref| pref[:code] }
          }
      end

      def currency_name(code)
        lookup(:currencies, code.upcase)
      end

      def prefecture_name(code)
        lookup(:prefectures, "%02d" % code.to_i)
      end

      def prefecture_codes_by_area(name)
        lookup(:prefecture_areas, name)
      end

      def lookup(type, val)
        data(type)[val]
      end

      def options_for_select(type)
        data(type).invert.to_a # FIXME FormHelper にしたい
      end

      private

      def data(type)
        __send__(type.intern)
      end
    end
  end
end
