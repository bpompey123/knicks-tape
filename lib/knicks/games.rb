class Games
  attr_accessor :date, :location, :opponent

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end



end
