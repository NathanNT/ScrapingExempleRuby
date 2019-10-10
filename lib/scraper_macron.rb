require 'rubygems'
require 'nokogiri'
require 'open-uri'
mail = []
name = []
page = Nokogiri::HTML(open('https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=576'))
page.xpath('//div[1]/ul/li[1]/h2').each do |node|
  name << node.text
end
name = name.map { |x| x.sub('M ', '').sub('Mme', '').split(' ') }
i = 1
h = []
while i < 577

  if page.xpath("//div[1]/ul[#{i}]/li[4]/a").text.include? '@'
    mail << page.xpath("//div[1]/ul[#{i}]/li[4]/a").text
    i += 1
  else
    mail << page.xpath("//div[1]/ul[#{i}]/li[5]/a").text
    i += 1
  end
end

576.times do |i| # rubocop:todo Lint/ShadowingOuterLocalVariable
  h << { 'first_name' => name[i][0], 'second_name' => name[i][1], 'email' => mail[i] }
end

print h
