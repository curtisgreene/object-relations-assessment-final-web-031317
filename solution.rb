class Viewer

  attr_accessor :first_name, :last_name

  ALL = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    ALL << self
  end

  def self.all
    ALL
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(name)
    self.all.find do |viewer|
      viewer.full_name == name
    end
  end

  def create_rating(score, movie)
    Rating.new(score, self, movie)
  end

end

##########################################

class Rating

  attr_accessor :score
  attr_reader :viewer, :movie

  ALL = []

  def initialize(score, viewer, movie)
    @score = score
    @viewer = viewer
    @movie = movie
    ALL << self
  end

  def self.all
    ALL
  end

end

##########################################

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
