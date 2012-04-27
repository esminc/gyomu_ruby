# coding: utf-8
require 'moji'

module GyomuRuby
  module OrdinarySystemDevelopment
    module WordNormalizer
      extend self
      def to_doublewidth_hiragana(word)
        normalize_symbol_unicode(Moji.kata_to_hira(Moji.han_to_zen(word || '', Moji::KANA)))
      end
      alias to_kana to_doublewidth_hiragana

      def normalize_unconversion_symbol_unicode(word)
        word.tap do |w|
          w.gsub!(/\u2212|\u2012|\u2013|\u2014/){ "\u30fc" }
          w.gsub!(/\u301c/){ "\uff5e" }
        end
      end

      def normalize_symbol_unicode(word)
        normalize_unconversion_symbol_unicode(word).tap do |w|
          w.gsub!(/\u002d|\uff0d|\u2015|\u2500/){ "\u30fc" }
        end
      end

      def to_time(word)
        if word.acts_like?(:time) && word.acts_like_time?
          word
        else
          Time.parse(word.to_s) rescue nil
        end
      end

      def to_date(word)
        if word.acts_like?(:date) && word.acts_like_date?
          word
        elsif word.respond_to?(:to_date)
          word.to_date
        else
          Date.parse(word.to_s) rescue nil
        end
      end

      def to_array(words)
        if words.is_a?(Hash)
          words.inject([]){|memo, (k,v)| v.blank? ? memo : memo << k.to_s }
        else
          Array(words)
        end
      end

      # XXX 0x20が壊れる詳細を追いかける
      def to_hankaku(word)
        return '' if word.blank?
        Moji.zen_to_han(Moji.han_to_zen(normalize_symbol_unicode(word), Moji::SYMBOL)).gsub(/\uff70/){ "\u002d" }
      end

      def to_numeric(word)
        return word.to_s if word.is_a?(Numeric)
        to_hankaku(word || '').scan(/\d/).join
      end
    end
  end
end
