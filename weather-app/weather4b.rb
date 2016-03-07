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