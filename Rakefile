require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
	t.pattern = "spec/**/*_spec.rb"
end

task :default => [:spec]
