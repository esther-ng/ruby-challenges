require 'rubygems'
require 'rubyweather'

require 'weather/service'

service = Weather::Service.new
service.partner_id = 
service.license_key = 

locations = service.find_location("11231")
puts "Matching Locations: " + locations.inspect