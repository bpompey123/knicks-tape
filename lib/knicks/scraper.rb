require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  site = "https://www.basketball-reference.com/teams/NYK/2020_games.html"

  doc = Nokogiri::HTML(open(site))

  games = doc.css("table.stats_table tbody tr")

  games.each do |match|
    all_games = []
    data = match.css("td")
    data.each do |match_info|
      stat = match_info.attr("data-stat")
      case stat
      when "date_game"
        date = match_info.text
      when "game_start_time"
        time = match_info.text
      when "opp_name"
        opponent = match_info.text

      all_games << {date: date, time: time, opponent: opponent}
      end

    end
  end




end
