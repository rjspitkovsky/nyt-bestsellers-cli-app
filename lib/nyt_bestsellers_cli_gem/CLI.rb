class CLI

  def call
    Scraper.new.scrape
    pick_category
    book_details
  end

  def pick_category
    puts "Welcome to the New York Times Bestseller List!"
    Category.all.each.with_index(1) do |section_title, i|
      puts "#{i}. #{section_title.name}"
    end
    puts "Please choose the number of the category you wish to inspect:"
    input = gets.strip
    if input == "exit"
      puts "Thank you for stopping by!"
      exit
    elsif input.to_i > 0 && input.to_i < 6
       Category.all[input.to_i - 1].books.each do |book|
         puts "#{book.title} - #{book.author}"
       end
    else
      pick_category
      book_details
    end
  end

  def book_details
    puts "Please type in the title of the book to see its summary."
    puts "Type back to review other categories."
      input = gets.strip.upcase

      if Book.find_by_title(input) != nil

        if Book.find_by_title(input).summary != ""
          puts Book.find_by_title(input).summary
          puts "Would you like to buy this book? (y/n)"
            input = gets.strip.downcase

              if input == "y"
                system("open https://www.nytimes.com/books/best-sellers/")
              else
                puts "Type exit at anytime to exit."
                pick_category
                book_details
              end

        else
          puts "Sorry, this book does not have a summary provided."
          puts "Type exit at anytime to exit."
          pick_category
          book_details
        end

      else
      puts "Type exit at anytime to exit."
      pick_category
      book_details
      end
    end
end
