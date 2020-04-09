class BreweriesController < ApplicationController

    def index 
        breweries = Brewery.all
        ratings = Rating.all
        render json: { breweries: breweries, ratings: ratings }
    end 

    def create 
        @brewery = {
            name: params['name'],
            brewery_type: params['kind'],
            address: params['address'], 
            city: params['city'],
            state: params['state'],
            zip: params['postal_code'],
            country: params['country'],
            phone: params['phone_number'],
            website: params['website']
        }
        brewery = Brewery.create(@brewery)
        if brewery.valid? 
            render json: brewery
        else 
            render json: { error: 'failed to create brewery' }, status: :not_acceptable
        end 
    end 

    def update
        byebug
    end 

    def destroy
        brewery = Brewery.find(params['id'])
        brewery.destroy
        breweries = Brewery.all
        render json: breweries
    end 
end
