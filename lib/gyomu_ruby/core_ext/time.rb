#coding: utf-8
require 'gyomu_ruby/core_ext/time/biz_year'

Time.class_eval do
  include GyomuRuby::CoreExt::Time::BizYear
end

