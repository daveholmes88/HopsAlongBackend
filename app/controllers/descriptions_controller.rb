class DescriptionsController < ApplicationController

    def create 
        my_location = Geocoder.search(params['location'])
        array = my_location.first.coordinates
        breweries = Brewery.near(params['location'])
        render json: {breweries: breweries, location: array}
    end 
end
