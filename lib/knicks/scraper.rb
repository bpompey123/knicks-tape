class Scraper

  def get_page
    Nokogiri::HTML(open("https://www.nba.com/knicks/schedule"))
  end

  





end
