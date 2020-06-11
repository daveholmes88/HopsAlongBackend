# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'open-uri'
require 'json'
# User.destroy_all
# Rating.destroy_all
# Brewery.destroy_all
states1 = ["Alaska", "Alabama", "Arkansas",  "Arizona", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia",  "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Virginia",  "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"]
states2 = ["Arizona", "California", "Colorado", "Connecticut", "Florida", "Georgia",  "Iowa", "Idaho", "Illinois", "Indiana", "Kentucky",  "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri",  "Montana", "North Carolina", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oregon", "Pennsylvania", "South Carolina",  "Tennessee", "Texas", "Virginia", "Vermont", "Washington", "Wisconsin"]
states3 = ["Arizona", "California", "Colorado", "Florida", "Georgia",  "Illinois", "Indiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri",  "North Carolina", "New Jersey", "New York", "Ohio", "Oregon", "Pennsylvania",  "Tennessee", "Texas", "Virginia",  "Washington", "Wisconsin"]
states4 = ["California", "Colorado", "Florida",  "Illinois", "Indiana", "Massachusetts",  "Michigan", "Minnesota",   "North Carolina",  "New York", "Ohio", "Oregon", "Pennsylvania",  "Texas", "Virginia",  "Washington", "Wisconsin"]
states5 = ["California", "Colorado", "Florida",  "Illinois",   "Michigan", "Minnesota",   "North Carolina",  "New York", "Ohio", "Oregon", "Pennsylvania",  "Texas", "Virginia",  "Washington", "Wisconsin"]
states6 = ["California", "Colorado", "Florida",  "Illinois",   "Michigan",   "North Carolina",  "New York", "Ohio", "Oregon", "Pennsylvania",  "Texas", "Virginia",  "Washington"]
states7 = ["California", "Colorado", "Florida", "Michigan", "North Carolina", "New York", "Ohio", "Pennsylvania", "Texas", "Washington"]
states8 = ["California", "Colorado", "Michigan", "New York", "Pennsylvania", "Texas", "Washington"]
states9 = ["California", "Colorado", "New York", "Washington"]
states9.each do |state|
    url = "https://api.openbrewerydb.org/breweries?per_page=50&by_state=#{state}&page=9"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response_array = JSON.parse(response.body)
    response_array.map do |brewery|
        Brewery.create(name: brewery['name'], 
            brewery_type: brewery['brewery_type'],
            address: brewery['street'],
            city: brewery['city'],
            state: brewery['state'],
            zip: brewery['postal_code'], 
            country: brewery['country'],
            longitude: brewery['longitude'].to_f,
            latitude: brewery['latitude'].to_f,
            phone: brewery['phone'], 
            website: brewery['website_url'])
    end 
end 

