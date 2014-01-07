# encoding: utf-8

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => "spec:all"

namespace :spec do
  desc "Run Tests"
  task :all do
    sh "BUNDLE_GEMFILE='gemfiles/active_record_40.gemfile' bundle install --quiet"
    sh "BUNDLE_GEMFILE='gemfiles/active_record_40.gemfile' bundle exec rake spec"
  end
end
