# coding: utf-8

require 'active_support/core_ext/string'

module GyomuRuby
  module MasterData
    module FormHelper
      %w(prefecture currency).each do |master|
        method_name = %(options_for_#{master}_select)

        define_method method_name do
          MasterData.data[master.pluralize.intern].invert.to_a
        end
        module_function method_name
      end
    end
  end
end
