class Book

  attr_accessor :title, :author, :summary, :category

  @@all = []

    def initialize(title = nil, author = nil, summary = nil, category = nil)
      @title = title
      @author = author
      @summary = summary
      @category = category
      @@all << self
      add_book_to_category(category)
    end

    def add_book_to_category(category)
      # adds the book that was just created to the Category instance that was passed to the Book on instantiation. 
      Category.all.detect {|type| type.name == category}.books << self
    end

    def self.all
      @@all
    end

    def self.find_by_title(title)
      self.all.detect {|book| book.title == title}
    end


end
