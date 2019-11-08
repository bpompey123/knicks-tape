
class Games
  attr_accessor :date, :location, :opponent

  @@all = []

  def initialize(date, location, opponent)
    @date= date
    @location= location
    @opponent= opponent
    @@all << self
  end

  def self.all
    @@all
  end

  def game(date, location, opponent)
    Games.new(date, location, opponent)
  end

  def self.find_by_date(date)
    self.all.find { |match| match.date == date}
  end

  def self.find_by_opponent(opponent)
    self.all.find { |match| match.opponent == opponent}
  end

  def self.find_by_location(location)
    self.all.find { |match| match.location == location}
  end



end
