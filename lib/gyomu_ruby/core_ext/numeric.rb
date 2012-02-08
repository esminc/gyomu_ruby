# coding: utf-8
require 'gyomu_ruby/core_ext/numeric/round'

Numeric.class_eval do
  include GyomuRuby::CoreExt::Numeric::Round
end
