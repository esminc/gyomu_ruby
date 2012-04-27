#coding: utf-8
require 'moji'

module GyomuRuby::Validators
  class HankakuValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, str)
      record.errors[attribute] << "は、半角文字で入力してください" unless hankaku?(str)
    end

    def hankaku?(str)
      str.blank? || str =~ /\A#{Moji.han}+\Z/
    end
  end
end
