# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'gyomu_ruby/version'

Gem::Specification.new do |s|
  s.name        = 'gyomu_ruby'
  s.version     = GyomuRuby::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['ESM, Inc.']
  s.homepage    = 'https://agile.esm.co.jp/'
  s.summary     = %q{GyomuRuby}
  s.description = %q{GyomuRuby}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'activesupport', ['>= 3.0']
  s.add_dependency 'moji'

  s.add_development_dependency 'rspec', ['>= 3.0.0']
end
