class GoldMiners::Scraper #scope accessor creates namespace

  def get_page
    # instance method will be responsible for using Nokogiri and open-uri to grab the entire HTML document from cnbc.com
    Nokogiri::HTML(open("https://www.cnbc.com/quotes/?symbol=gdx%2C%20abx%2C%20nem%2C%20gg%2C%20sand%2C%20gold%2C%20iag%2C%20rgld%2C%20fnv%2C%20ego%2C%20auy%2C%20aem%2C%20au%2C%20gfi%2C%20kgc%2C%20ng"))
  end

  def get_quotes
    # instance method will be responsible for using a CSS selector to return XML elements as an array that contain all the attributes needed for a quote
      self.get_page.css(".quote-custom-strip")
  end

  def make_quotes
    # instance method will be responsible for iterating over XML array in .get_quotes
    # to instantiate Quote objects with corresponding properties
    self.get_quotes.each do |doc|
      ticker = doc.css("span.symbol").text
      name = doc.css("h1").text
      price = doc.css("span.last").text.split("")[0..4].join.gsub("%", "")
      volume = doc.css("span.volume").text.split("")[0..6].join
      low = doc.css(".low").text
      high = doc.css(".high").text
      GoldMiners::Quote.new(ticker, name, price, volume, low, high)
      # return value is self.get_quotes
      # instances created in .each are saved in Quote.rb using self.all when initialized
    end
  end

end
