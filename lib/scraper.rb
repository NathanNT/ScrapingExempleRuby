require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scraper
  page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  crypto_price = page.css('a.price')
  parsed_price = []
  crypto_price.size.times do |i|
    parsed_price << crypto_price[i].text
  end
  crypto_name = page.css('a.currency-name-container')
  parsed_name = []
  crypto_name.size.times do |i|
    parsed_name << crypto_name[i].text
  end

  crypto_array = []
  i = 0
  while i < parsed_price.size
    crypto_array << { parsed_name[i] => parsed_price[i] }
    i += 1
  end
  puts crypto_array
  return crypto_array
end

def testing(test)
  crypto_array = scraper
  return crypto_array[test]
end

scraper
