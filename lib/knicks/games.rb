
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
    @@all.detect { |match| match.date == date}
    chosen.each do |date, location, opponent|
      date = "#{date}", location = "#{location}" , opponent = "#{opponent}"
    end
  end

  def self.find_by_opponent(opponent)
    chosen = @@all.detect { |match| match.opponent == opponent}
#    binding.pry
#    @date = chosen.date
#    @location= chosen.location
#    @opponent= chosen.opponent
  end

  def self.find_by_location(location)
    chosen = @@all.detect { |match| match.location == location}

  end



end
