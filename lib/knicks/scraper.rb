require 'open-uri'
require 'pry'

class Scraper

  def get_page
    Nokogiri::HTML(open("https://www.nba.com/knicks/schedule"))
  end

  def scrape_game_index
    self.get_page.css("div.list-item-date").each do |match|
      binding.pry

  end





end
