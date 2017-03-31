class Movie
  
  attr_accessor :title

  ALL = []

  def initialize(title)
    self.title = title
    ALL << self
  end

  def self.all
    ALL
  end

  def self.find_by_title(title)
    self.all.find do |movie|
      movie.title = title
    end
  end

  def ratings
    Rating.all.select do |rating|
      rating.movie == self
    end
  end

  def viewers
    self.ratings.collect do |rating|
      rating.viewer
    end
  end

  def average_rating
    self.ratings.collect do |rating|
      rating.score
    end.reduce(0.0, :+) / self.ratings.length
  end

end
