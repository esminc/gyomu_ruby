# coding: utf-8

module GyomuRuby
  module MasterData
    @@currencies = {
      'JPY' => '円',
      'USD' => '米ドル',
      'EUR' => 'ユーロ'
    }

    @@prefectures, @@areas = {}, {}
    { # https://www.lasdec.or.jp/cms/1,0,14.html
      '北海道' => %w(北海道),
      '東北'   => %w(青森県 岩手県 宮城県 秋田県 山形県 福島県),
      '関東'   => %w(茨城県 栃木県 群馬県 埼玉県 千葉県 東京都 神奈川県),
      '中部'   => %w(新潟県 富山県 石川県 福井県 山梨県 長野県 岐阜県 静岡県 愛知県),
      '近畿'   => %w(三重県 滋賀県 京都府 大阪府 兵庫県 奈良県 和歌山県),
      '中国'   => %w(鳥取県 島根県 岡山県 広島県 山口県),
      '四国'   => %w(徳島県 香川県 愛媛県 高知県),
      '九州'   => %w(福岡県 佐賀県 長崎県 熊本県 大分県 宮崎県 鹿児島県 沖縄県)
    }.each do |area_name, prefecture_names|
      @@areas[area_name] ||= []

      prefecture_names.each.with_index(@@prefectures.length) do |prefecture_name, index|
        code = '%02d' % index.next

        @@prefectures[code] = prefecture_name
        @@areas[area_name] << code
      end
    end

    class << self
      def currency_name(code)
        lookup(:currencies, code.to_s.upcase)
      end

      def prefecture_name(code)
        lookup(:prefectures, "%02d" % code.to_i)
      end

      def prefecture_codes_by_area(name)
        lookup(:areas, name)
      end

      def lookup(type, val)
        data(type)[val]
      end

      def options_for_select(type)
        data(type).invert.to_a # FIXME FormHelper にしたい
      end

      def data(type)
        MasterData.class_variable_get("@@#{type}")
      end
    end
  end
end
