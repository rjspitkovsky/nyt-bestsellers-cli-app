class CLI

  def call
    Scraper.new.scrape
    greeting
    pick_category
    book_details
  end

  def greeting
    puts "Welcome to the New York Times Bestseller List!"
    Category.all.each.with_index(1) do |section_title, i|
      puts "#{i}. #{section_title.name}"
    end
    #puts "Please choose a category:"
  end

  def pick_category
    puts "Please choose the number of the category you wish to inspect:"
    input = gets.strip
    if input.to_i > 0 && input.to_i < 6
       Category.all[input.to_i - 1].books.each.with_index(1) do |book, i|
         puts "#{i}. #{book.title} - #{book.author}"
       end
    else
      pick_category
  end
end

  def book_details
    input = ""
    puts "Please type in the title of the book to see its summary."
    puts "Type back to review other categories."
    while input != "back"
      input = gets.strip.upcase
      if Book.find_by_title(input) != nil
        if Book.find_by_title(input).summary != ""
          puts Book.find_by_title(input).summary
        else
          puts "Sorry, this book does not have a summary provided."
        break
      end
      end
      greeting
      pick_category
      book_details
    end
  end




end
