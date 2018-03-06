class CLI

  def call
    Scraper.new.scrape
    greeting
    pick_category
    book_details
  end

  def greeting
    puts "Welcome to the New York Times Bestseller List!"
    # Category.all.each.with_index(1) do |section_title, i|
    #   puts "#{i}. #{section_title.name}"
    # end
    #puts "Please choose a category:"
  end

  def pick_category
    Category.all.each.with_index(1) do |section_title, i|
      puts "#{i}. #{section_title.name}"
    end
    puts "Please choose the number of the category you wish to inspect:"
    input = gets.strip
    if input == "exit"
      goodbye!
      exit
    elsif input.to_i > 0 && input.to_i < 6
       Category.all[input.to_i - 1].books.each.with_index(1) do |book, i|
         puts "#{i}. #{book.title} - #{book.author}"
       end
    else
      pick_category
      book_details
  end
end

  def book_details
    puts "Please type in the title of the book to see its summary."
    puts "Type back to review other categories."
      #while input != "back" || input != "exit"
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


          #puts "Would you like to see another books summary? (y/n)"
          #pick_another_book

        else
          puts "Sorry, this book does not have a summary provided."
          puts "Type exit at anytime to exit."
          pick_category
          book_details
          #pick_another_book
          #break

        end

      else
      puts "Type exit at anytime to exit."
      pick_category
      book_details

      end

      #pick_category
    #end
  end


# def pick_another_book
#   input = ""
#   puts "Would you like to see another books' summary? (y/n)"
#   until input != "exit"
#   input = gets.strip
#   if input.upcase == "Y" || "YES"
#     pick_category
#     book_details
#   else
#     goodbye!
#   end
# end
# end
#
#
  def goodbye!
    # input = ""
    # input = gets.strip
    # if input == "exit"
    puts "Thank you for stopping by!"
  end
  #end



end
