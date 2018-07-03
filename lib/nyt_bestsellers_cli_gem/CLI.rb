class CLI

  # Control flow logic here
  # Whenever I saw the same code being used in multiple places I abstracted into helper methods

  def call
    # First objective is to scrape the information, then provide the interface to the user
    Scraper.new.scrape
    pick_category
  end

  def pick_category
    # Phase 1: Welcome to the interface and choosing a category
    spaces
    puts "WELCOME TO THE NEW YORK TIMES BESTSELLER LIST!"
    spaces
    Category.all.each.with_index(1) do |category_instance, i|
      puts "#{i}. #{category_instance.name}".upcase
      # UPCASE is used to make it easier to read for the user
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
       book_details
    else
      return_to_pick_category
    end
  end

  def book_details
    # Phase 2: Choosing a book from the category and reading its summary
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
          # Sometimes the NYT does not provide a summary for a book
          puts "Sorry, this book does not have a summary provided.".upcase
          buy_book
        end

      else
        return_to_pick_category
      end
    end

###HELPER METHODS
    def spaces
      # This helper method is just to make things look (a little) neater
      puts ""
      puts ""
    end

    def return_to_pick_category
      # After the first time through the interface, a user should be reminded that they can type exit any time to exit
      spaces
      puts "Type exit at anytime to exit.".upcase
      pick_category
    end

    def buy_book
      # Phase 3: Would the user want to buy this book?
      puts "Would you like to buy this book? (y/n)".upcase
        input = gets.strip.downcase
        if input == "y"
          system("open https://www.nytimes.com/books/best-sellers/")
          return_to_pick_category
        else
          return_to_pick_category
        end
    end
end
