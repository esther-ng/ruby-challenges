require 'yahoo_weatherman'

puts "What's your zip code?"
location = gets.chomp.to_i
puts location
def weather(location)
    client = Weatherman::Client.new
    response = client.lookup_by_location(location).condition['temp']
    puts response
end
weather(location)