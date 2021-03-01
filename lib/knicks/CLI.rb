class KnicksTape::CLI

  def call
    puts "--------------Welcome to the KnicksTape!!------------------"
    Scraper.list_all_games
    start
  end

  def start
    puts "---------------------------------------------------------------------------------------------------------------"
    puts "As an avid fan of the NY Knicks, I'm sure you can't wait to get an opportunity to watch your favorite team play"

    puts "It's a long season and hopefully your availability matches one of the team's games."

    puts "Would you like to search for a game by date, location, or by opponent?"
    input = gets.strip.downcase

    if input == "date"
      puts "Which date are you looking to attend? Please use (Month day, year) format"
      date = gets.strip
      d = Date.parse(date)

    print_by_date(d)

    elsif input == "location"
      puts "At which venue are you hoping to watch the Knicks play?"
      location = gets.strip

      print_by_location(location)

    elsif input == "opponent"
      puts "Who would you like to see the knicks defeat? ;-)"
      opponent = gets.strip

      print_by_opponent(opponent)

    else
      puts "I don't recognize that input, please try again!"
      start
    end

  end


  def print_by_date(date)
    chosen = Games.find_by_date(date)
    if chosen
      show_game(chosen)
      anything_else
    else
      puts "Sorry the Knicks aren't playing that day! Maybe try another date?(y/n)"
      goodbye

    end
  end

  def print_by_location(location)
    chosen = Games.find_by_location(location)
    if chosen
      show_game(chosen)
      anything_else
    else
      puts "The Knicks aren't playing there this year. Would you like to try another venue?(y/n)"
      goodbye

    end

  end

  def print_by_opponent(opponent)
    chosen = Games.find_by_opponent(opponent)

    if chosen != []
      chosen.each do |game|
        show_game(game)
      end
      anything_else
    else
      puts "The Knicks won't get to beat those guys this year. Would you like to try another opponent(y/n)?"
      goodbye

    end
  end

  def buy_a_ticket
    puts "---------------------------------------------------------------------------------------------------------"
    puts "If you're looking to buy tickets, head to https://www.stubhub.com/new-york-knicks-tickets/performer/2742/"
    puts "---------------------------------------------------------------------------------------------------------"
  end

  def buy_an_away_ticket
    puts "---------------------------------------------------------------------------------------------------------------"
    puts "                               Looks like this is an away game.                                                "
    puts "If you're still looking to buy tickets, head to https://www.stubhub.com/new-york-knicks-tickets/performer/2742/"
    puts "---------------------------------------------------------------------------------------------------------------"
  end

  def show_game(chosen)
    puts "The Knicks will be playing #{chosen.opponent} on #{chosen.date.strftime("%b %-d, %Y")} at #{chosen.location}."
    if chosen.location == "Madison Square Garden"
      buy_a_ticket
    else
      buy_an_away_ticket
    end
  end

  def goodbye
    input = gets.strip
    if input == "y"
      start
    else
      puts "Have a good day!"
    end
  end

  def anything_else
    puts "Is there any other game you would like to search for?"
    input = gets.strip
    if input == "y"
      start
    else
      puts "Have a good day!"
    end
  end

end
