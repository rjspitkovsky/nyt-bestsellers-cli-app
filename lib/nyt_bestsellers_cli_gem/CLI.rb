class CLI

  def call
    Scraper.new.scrape
    pick_category
    book_details
  end

  def pick_category
    spaces
    puts "WELCOME TO THE NEW YORK TIMES BESTSELLER LIST!"
    spaces
    Category.all.each.with_index(1) do |section_title, i|
      puts "#{i}. #{section_title.name}".upcase
    end
    spaces
    puts "Please choose the number of the category you wish to inspect:".upcase
    input = gets.strip
    if input == "exit"
      spaces
      puts "Thank you for stopping by!".upcase
      exit
    elsif input.to_i > 0 && input.to_i < 6
       Category.all[input.to_i - 1].books.each do |book|
         spaces
         puts "#{book.title} - #{book.author}".upcase
       end
    else
      pick_category
      book_details
    end
  end

  def book_details
    spaces
    puts "Please type in the title of the book to see its summary.".upcase
    puts "Type back to review other categories.".upcase
      input = gets.strip.upcase

      if Book.find_by_title(input) != nil

        if Book.find_by_title(input).summary != ""
          spaces
          puts Book.find_by_title(input).summary.upcase
          buy_book
        else
          puts "Sorry, this book does not have a summary provided.".upcase
          buy_book
        end
        
      else
        return_to_list
      end
    end

###HELPER METHODS
    def spaces
      puts ""
      puts ""
    end

    def return_to_list
      puts "Type exit at anytime to exit.".upcase
      pick_category
      book_details
    end

    def buy_book
      puts "Would you like to buy this book? (y/n)".upcase
        input = gets.strip.downcase

          if input == "y"
            system("open https://www.nytimes.com/books/best-sellers/")
          else
            return_to_list
          end
      end
end
