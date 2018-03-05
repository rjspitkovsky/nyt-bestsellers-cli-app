class Category

  attr_accessor :name, :books

  @@all = []

  def initialize(name)
    @name = name
    @books = []
    @@all << self 
  end

  def self.all
    @@all
  end

end
