require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mechanize'
require 'rspec'
PAGE_URL = 'https://coinmarketcap.com/all/views/all/'

def coinmarket
begin
page  = Nokogiri::HTML(open(PAGE_URL))
name , value , array = [], [], []
hash = Hash.new


puts "Getting all value"
page.xpath('//tr/td[5]/a').each do |v|
  value << v.text.delete('$,').to_f
end

puts "Getting all name"
page.xpath('//tr/td[3]/div').each do |v|
  name << v.text
end

hash = name.zip(value)
puts "Putting them in an hash"
hash.each do |v| 
  array << {v[0] => v[1]}
end

end
return array
end

puts coinmarket.to_s