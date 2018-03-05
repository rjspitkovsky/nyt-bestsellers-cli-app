class Category

  attr_accessor :name, :books

  @@all = []

  def initialize(name)
    @name = name
    @books = []
  end

  def self.all
    @@all
  end 

end
