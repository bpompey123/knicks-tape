
class Games
  attr_accessor :date, :location, :opponent

  @@all = []

  def initialize(date, location, opponent)
    @date= Date.parse(date)
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
    all.detect { |match| match.date == date}
  end

  def self.find_by_opponent(opponent)
    all.select { |match| match.opponent == opponent}
  end

  def self.find_by_location(location)
    all.detect { |match| match.location == location}
  end


end
