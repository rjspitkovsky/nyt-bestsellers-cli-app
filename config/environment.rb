require_relative '../lib/nyt_bestsellers_cli_gem/CLI'

require "bundler/setup"
require "./lib/nyt_bestsellers_cli_gem"


require 'bundler'
Bundler.require
require_all './lib'

puts "Testing environment"
