class BreweriesController < ApplicationController

    def index 
        breweries = Brewery.all
        ratings = Rating.all
        render json: { breweries: breweries, ratings: ratings }
    end 

    def create 
        @brewery = {
            name: params['name'],
            brewery_type: params['brewery_type'],
            address: params['address'], 
            city: params['city'],
            state: params['state'],
            zip: params['zip'],
            longitude: params['longitude'],
            latitude: params['latitude'],
            country: params['country'],
            phone: params['phone'],
            website: params['website']
        }
        brewery = Brewery.create(@brewery)
        if brewery.valid? 
            @admin = AdminNew.find(params['id'])
            @admin.destroy
            admin = AdminNew.all
            render json: admin
        else 
            render json: { error: 'failed to create brewery' }, status: :not_acceptable
        end 
    end 

    def update
        brewery=Brewery.find(params['brewery']['brewery_id'])
        brewery.update(
            name: params['brewery']['name'],
            brewery_type: params['brewery']['brewery_type'],
            address: params['brewery']['address'],
            city: params['brewery']['city'],
            state: params['brewery']['state'],
            zip: params['brewery']['zip'], 
            country: params['brewery']['country'], 
            phone: params['brewery']['phone'], 
            website: params['brewery']['website'], 
            latitude: params['brewery']['latitude'],
            longitude: params['brewery']['longitude'])
        if brewery.valid? 
            admin_edit = AdminEdit.find(params['brewery']['id'])
            admin_edit.destroy
            admin_edits = AdminEdit.all
            render json: admin_edits 
        else 
            render json: { error: 'failed to edit brewery' }, status: :not_acceptable
        end 
        
    end 

    def destroy
        brewery = Brewery.find(params['id'])
        brewery.destroy
        breweries = Brewery.all
        render json: breweries
    end 
end
