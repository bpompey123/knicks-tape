require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  site = "https://basketball.realgm.com/nba/teams/New-York-Knicks/20/Schedule"

  doc = Nokogiri::HTML(open(site))

  games = doc.css("table.basketball tbody tr")

  def list_all_games
    games.each do |match|
      all_games = []
      data = match.css("td")
      data.each do |match_info|
        stat = match_info.attr("data-th")
        if stat == "Date"
          date = match_info.css("a").text
        elsif stat == "Opponent"
          opponent =  match_info.css("a").text
        elsif stat == "Venue"
          location = match_info.css("a").text

        all_games << {date: date, opponent: opponent, location: location}
        end
      end
      all_games
    end
  end


  def game_finder
    all_games.find { ||}


  end






end
