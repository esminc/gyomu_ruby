# coding: us-ascii
require 'forgery'

Forgery.load_from!(File.dirname(__FILE__) + '/..')

class Forgery::JaName < Forgery
  def self.full_name
    full_name_with_kana.split('@').last
  end

  def self.full_name_with_kana
    fn, fnk = first_name_with_kana.split('@')
    ln, lnk = last_name_with_kana.split('@')
    "#{ln} #{fn}@#{lnk} #{fnk}"
  end

  def self.last_name
    last_name_with_kana.split('@').first
  end

  def self.last_name_with_kana
    dictionaries[:ja_last_names].random
  end

  def self.first_name
    first_name_with_kana.split('@').first
  end

  def self.first_name_with_kana
    [dictionaries[:ja_male_first_names], dictionaries[:ja_female_first_names]].random.random
  end

  def self.male_first_name_with_kana
    dictionaries[:ja_male_first_names].random
  end

  def self.female_first_name_with_kana
    dictionaries[:ja_female_first_names].random
  end
end
