class Book

  attr_accessor :title, :author, :summary, :purchase_url, :category

  @@all = []

    def initialize(title, author, summary, purchase_url, category)
      @title = title
      @author = author
      @summary = summary
      @purchase_url = purchase_url
      @category = category
      @@all << self
      add_book_to_category(category)
    end

    def add_book_to_category(category)
      Category.all.detect {|type| type.name == category}.books << self 
    end

    def self.all
      @@all
    end


end
