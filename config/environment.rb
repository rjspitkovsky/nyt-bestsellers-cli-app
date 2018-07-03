# require_relative '../lib/nyt_bestsellers_cli_gem/CLI'
# require_relative '../lib/nyt_bestsellers_cli_gem/scraper'
# require_relative '../lib/nyt_bestsellers_cli_gem/category'
# require_relative '../lib/nyt_bestsellers_cli_gem/book'
#other lib files go here
# require_all './lib' requires all the files listed above


require "bundler/setup"
require "nyt_bestsellers_cli_gem"


require 'bundler'
Bundler.require


require_all './lib'
