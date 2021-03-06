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

=begin
response.forecasts.each do |w|
    if (today == w['day'])
        puts "hello"
    else
        puts "didn't work"
    puts "#{w['day']} is going to be #{w['text']} with a low of #{w['low']} and a high of #{w['high']} degrees celsius."
end


response.forecasts.each do |d|
    puts d['date'].strftime("%A")
end


Why not just access by position 0 and 1 for today and tomorrow?
def get_weather(w)

    if (w.downcase.include? "clear")
        puts "It's 70 degrees and clear out!"
    elsif (w.downcase.include? "sunny")
        puts "It's 85 degrees and sunny!"
    elsif (w.downcase.include? "cloudy")
        puts "It's 55 degrees and crazy cloudy!"
    elsif (w.downcase.include? "rainy")
        puts "It's 60 degrees and crazy rainy!"
    elsif (w.downcase.include? "snowy")
        puts "It's 32 degrees and super snowy!"
    elsif (w.downcase.include? "fair")
        puts "It's 65 degrees and fair out."
    else
        puts "Sorry, can't help you!"
    end
end
get_weather(weather)  
=end