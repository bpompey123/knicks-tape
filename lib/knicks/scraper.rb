class Scraper

  def self.list_all_games

    site = "https://basketball.realgm.com/nba/teams/New-York-Knicks/20/Schedule"
    doc = Nokogiri::HTML(open(site))

    games = doc.css("table.basketball tbody tr")

    games.each do |match|
      all_games = []
      date = nil
      opponent = nil
      location = nil
      data = match.css("td")
      data.each do |match_info|
        stat = match_info.attr("data-th")
        if stat == "Date"
          date = match_info.css("a").text
        elsif stat == "Opponent"
          opponent =  match_info.css("a").text
        elsif stat == "Venue"
          location = match_info.css("a").text

#        all_games << {date: date, opponent: opponent, location: location}

        end
      end
      Games.new(date, location, opponent)

    end
  end


 



end
