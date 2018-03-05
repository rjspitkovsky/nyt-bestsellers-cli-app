class CLI

  def call
    Scraper.new.scrape
    greeting
  end

  def greeting
    puts "Welcome to the New York Times Bestseller List!"
    Category.all.each.with_index(1) do |section_title, i|
      puts "#{i}. #{section_title.name}"
    end
    puts "Please choose a category:"
  end

end
