class AdminEditsController < ApplicationController

    def create
        @admin_edit = {
            name: params['brewery']['name'],
            brewery_type: params['brewery']['brewery_type'],                
            address: params['brewery']['address'], 
            city: params['brewery']['city'],
            state: params['brewery']['state'],
            zip: params['brewery']['zip_code'],
            country: params['brewery']['country'],
            phone: params['brewery']['phone_number'],
            website: params['brewery']['website'],
            longitude: params['brewery']['longitude'],
            latitude: params['brewery']['latitude'],
            brewery_id: params['brewery']['id']
        }
        admin_edit = AdminEdit.create(@admin_edit)
        if admin_edit.valid? 
            render json: admin_edit
        else 
            render json: { error: 'failed to edit brewery' }, status: :not_acceptable
        end 
    end 

    def destroy
        brewery = AdminEdit.find(params['id'])
        brewery.destroy
        breweries = AdminEdit.all
        render json: breweries
    end 

end
