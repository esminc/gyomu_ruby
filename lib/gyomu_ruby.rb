# coding: utf-8
require 'gyomu_ruby/core_ext/time'
require 'gyomu_ruby/core_ext/numeric'
require 'gyomu_ruby/deprecation'

module GyomuRuby
  autoload :AmazonWebService,          'gyomu_ruby/amazon_web_service'
  autoload :MasterData,                'gyomu_ruby/master_data'
  autoload :AddressFormatter,          'gyomu_ruby/address_formatter'
  autoload :AllYourSiteAreBelongToSsl, 'gyomu_ruby/all_your_site_are_belong_to_ssl'
  autoload :Translation,               'gyomu_ruby/translated_from'
  autoload :WordNormalizer,            'gyomu_ruby/word_normalizer'
  autoload :AddressFormatter,          'gyomu_ruby/address_formatter'

  extend GyomuRuby::Deprecation::DeprecatedConstant

  deprecated :OrdinarySystemDevelopment, GyomuRuby
  deprecated :OSD,                       GyomuRuby
end
