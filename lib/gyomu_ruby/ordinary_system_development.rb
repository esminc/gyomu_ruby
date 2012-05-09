# coding: utf-8

module GyomuRuby
  module OrdinarySystemDevelopment
    osd_dir = 'gyomu_ruby/ordinary_system_development/'
    autoload 'AllYourSiteAreBelongToSsl', osd_dir + 'all_your_site_are_belong_to_ssl'
    autoload 'Translation', osd_dir + 'translated_from'
    autoload 'WordNormalizer', osd_dir + 'word_normalizer'
    autoload 'AddressFormatter', osd_dir + 'address_formatter'
  end
  OSD = OrdinarySystemDevelopment
end
