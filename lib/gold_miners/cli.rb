# CLI Controller responsible for business logic/user interaction with app
class GoldMiners::CLI

  def call
    GoldMiners::Scraper.new.make_quotes #creates an instance of Scraper class to create instances of Quote class
    list_quotes
    menu
    finish
  end

  def list_quotes
    puts " "
    puts "QUOTES FROM TODAY'S SESSION ARE AVAILABLE FOR THE FOLLOWING GOLD MINING STOCKS:"
    GoldMiners::Quote.all.each.with_index(1) do |quote, i|  #calls on Quote.all to print each instance created by .make_quotes
      puts "#{i}. TICKER: #{quote.ticker} NAME: #{quote.name}"
     end
    puts " "
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter a number for the stock you would like additional info on."
      puts "Enter list to display all stocks."
      puts "Enter exit when finished."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 17
        quote = GoldMiners::Quote.all[input.to_i-1]
        puts " "
        puts "TICKER: #{quote.ticker} NAME: #{quote.name} PRICE: #{quote.price} VOLUME: #{quote.volume} 52 WK LOW: #{quote.low} 52 WK HIGH: #{quote.high}"
        puts " "
      elsif input == "list"
        list_quotes
      elsif input == "exit"
        break
      else
        puts "Invalid entry. Please re-enter desired selection. Enter list to display all stocks or exit to finish."
      end
    end
  end

  def finish
    puts " "
    puts "The program is now exiting. Thank you for using the Gold Miners CLI App!"
    puts " "
  end

end
