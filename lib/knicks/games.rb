
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

  def find_by_date(date)
    game.find { |match| match.date == date}
  end

  def find_by_opponent(opponent)
    game.find { |match| match.opponent == opponent}
  end

  def find_by_location(location)
    game.find { |match| match.location == location}
  end



end
