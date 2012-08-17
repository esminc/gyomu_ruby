# coding: utf-8
require 'gyomu_ruby/core_ext/time'
require 'gyomu_ruby/core_ext/numeric'

module GyomuRuby
  autoload :AmazonWebService, 'gyomu_ruby/amazon_web_service'
  autoload :MasterData,       'gyomu_ruby/master_data'
  autoload :AddressFormatter, 'gyomu_ruby/address_formatter'
  autoload :Deprecation,      'gyomu_ruby/deprecation'

  # DEPRECATED
  osd_dir = 'gyomu_ruby/ordinary_system_development'
  autoload :OrdinarySystemDdevelopment, osd_dir
  autoload :OSD,                        osd_dir
end
