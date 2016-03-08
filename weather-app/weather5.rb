require "rubygems"
require "yahoo_weatherman"
require "net/http"
require "xmlsimple"

puts "What's youre zip code?"
z = gets.chomp
url = "http://where.yahooapis.com/v1/places.q(#{z})?appid=[dj0yJmk9eW13bERHRnBEQWRaJmQ9WVdrOVdVaE5ZVEZzTkcwbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD05NQ--"

xml_data = Net::HTTP.get_response(URI.parse(url)).body
data = XmlSimple.xml_in(xml_data)
id = data["place"][0]["woeid"]
sid = id.join.to_i

client = Weatherman::Client.new
response = client.lookup_by_woeid sid
weather = response.condition['text']


tod = Time.new
today = tod.strftime("%a")
tom = tod + 86400
tomorrow = tom.strftime("%a")

response.forecasts.each do |w|
    if (today == w['day'])
        puts "Today is going to be #{w['text']} with a low of #{w['low']} and a high of #{w['high']} degrees celsius."
    elsif (tomorrow == w['day'])
         puts "Tomorrow is going to be #{w['text']} with a low of #{w['low']} and a high of #{w['high']} degrees celsius."
    else
        day = w['date'].strftime("%A")
        puts "#{day} is going to be #{w['text']} with a low of #{w['low']} and a high of #{w['high']} degrees celsius."
    end
end
