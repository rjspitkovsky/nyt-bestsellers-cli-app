require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
  end

  def scrape_category_name
    @doc.css("section.subcategory").each do |section|
      name = section.css("a.subcategory-heading-link").text
      Category.new(name)
    end 
  end


end
