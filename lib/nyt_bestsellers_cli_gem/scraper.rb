class Scraper

  attr_accessor :doc

  def initialize(url)
    @doc = Nokogiri::HTML(open(url))
  end

  def scrape_category_name
    @doc.css("header.subcategory-header h2.subcategory_heading a").attr("href").text
  end 


end
