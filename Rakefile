require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/extension_rake'
require 'acts-as-taggable-on'

RSpec::Core::RakeTask.new

task :default do
  if Dir["spec/dummy"].empty?
    Rake::Task[:test_app].invoke
    Dir.chdir("../../")
  end
  Rake::Task[:spec].invoke
end

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_blogit'
  Rake::Task['extension:test_app'].invoke
end


# #!/usr/bin/env rake
# $LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
#
# require "rubygems"
# require 'bundler/setup'
# require "blogit/version"
# require 'rspec/core'
# require 'rspec/core/rake_task'
#
# APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
#
# load 'rails/tasks/engine.rake'
#
# Dir[File.join(File.dirname(__FILE__), 'lib/tasks/**/*.rake')].each { |f| import f }
# Dir[File.join(File.dirname(__FILE__), 'spec/dummy/lib/tasks/**/*.rake')].
#     each { |f| import f }
#
# task :default => :spec
# RSpec::Core::RakeTask.new(:spec)
