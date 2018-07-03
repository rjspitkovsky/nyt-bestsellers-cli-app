require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
  end

  def scrape
    # Create an instance of a Category first so that a book can be added to the category when initialized
    # Then scrape for the remainder of the book details 
    scrape_category_name
    scrape_book_details
  end

  def scrape_category_name
    @doc.css("section.subcategory").each do |section|
      name = section.css("a.subcategory-heading-link").text.strip
      Category.new(name)
    end
  end

  def scrape_book_details
    @doc.css("section.subcategory").each do |section|
      category = section.css("a.subcategory-heading-link").text.strip
        section.css("li.trending").each do |bestseller|
          title = bestseller.css("h3.title").text
          author = bestseller.css("p.author").text.gsub("by ", "")
          summary = bestseller.css("p.description").text
          Book.new(title, author, summary, category)
        end
      end
  end


end
