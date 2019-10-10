require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_urls(townhall_names)
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  townhall_url = []
  townhall_names.size.times do |i|
    townhall_url << page.xpath('//td/p/a')[i]['href']
  end
  townhall_url
end

def get_townhall_name
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  townhall_names = []
  page.xpath('//td/p/a').each do |node|
    townhall_names << node.text.split.map(&:capitalize).join(' ').tr(' ', '-')
  end
  townhall_names
end

def get_townhall_email(townhall_url)
  city_emails = []
  townhall_url.size.times do |i|
    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/#{townhall_url[i].sub('.', '')}"))
    page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
      city_emails << node.text
    end
  end
  city_emails
end

def perform
  townhall_names = get_townhall_name
  townhall_url = get_townhall_urls(townhall_names)
  city_emails = get_townhall_email(townhall_url)
  parsed_city = []
  townhall_names.size.times do |i|
    parsed_city << { townhall_names[i] => city_emails[i] }
  end
  puts parsed_city
end

perform
