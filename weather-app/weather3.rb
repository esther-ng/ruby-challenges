require 'rubygems'
require 'wunderground'

w_api = Wunderground.new("a7d90819c3f784e7")

puts "What's youre zip code?"
z = gets.chomp
h = w_api.conditions_for(z)
w = h["current_observation"]["weather"]
    
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
    else
        puts "Sorry, can't help you!"
    end
end
get_weather(w)    
    