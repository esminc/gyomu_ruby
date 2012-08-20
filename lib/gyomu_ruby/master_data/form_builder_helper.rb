# coding: utf-8

module GyomuRuby
  module MasterData
    module FormBuilderHelper
      include FormHelper

      [:prefecture, :currency].each do |master|
        define_method %(#{master}_select) do |attribute, options = {}, html_options = {}|
          choices = __send__("options_for_#{master}_select")

          select(attribute, choices, options, html_options)
        end
      end
    end
  end
end
