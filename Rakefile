$:.unshift File.expand_path('../lib', __FILE__)

require 'bundler/setup'
require 'rake/testtask'
require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require_relative 'config/application'
  end
end

Rake::TestTask.new(:test) do |t|
  t.libs.push('test')
  t.test_files = FileList['test/**/*_test.rb']
end
