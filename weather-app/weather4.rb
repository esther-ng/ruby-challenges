require "rubygems"
require "yahoo_weatherman"
require "net/http"
require "xmlsimple"

puts "What's youre zip code?"
z = gets.chomp

def find_id(zip)
    url = "http://where.yahooapis.com/v1/places.q(#{zip})?appid=[dj0yJmk9eW13bERHRnBEQWRaJmQ9WVdrOVdVaE5ZVEZzTkcwbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD05NQ--"
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    data = XmlSimple.xml_in(xml_data)
    id = data["place"][0]["woeid"]
    client = Weatherman::Client.new
    response = client.lookup_by_woeid id
    puts response.condition['text']
end
find_id(z)