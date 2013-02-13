require 'bundler'
Bundler.require

require './app'

root_dir = File.dirname(__FILE__)

set :environment, :production
set :root,  root_dir
disable :run, :raise_errors, :show_exceptions
set :raise_errors, true

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new('log/production.log', 'a')
$stdout.reopen(log)
$stderr.reopen(log)

run Sinatra::Application
