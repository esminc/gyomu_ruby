# coding: utf-8

module GyomuRuby
  class Translation
    def self.source(word, scope)
      new('ja').source(word, scope)
    end

    def initialize(locale = I18n.locale)
      @locale = locale
    end

    def source(word, scope)
      I18n.t!(scope, locale: @locale).key(word.to_s).try(:to_s)
    end
  end
end
