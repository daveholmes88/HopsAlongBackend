class AdminEditsController < ApplicationController

    def create
        @admin_edit = {
            name: params['name'],
            brewery_type: params['kind'],                
            address: params['address'], 
            city: params['city'],
            state: params['state'],
            zip: params['zip_code'],
            country: params['country'],
            phone: params['phone_number'],
            website: params['website']
        }
        admin_edit = AdminEdit.create(@admin_new)
        if admin_edit.valid? 
            render json: admin_edit
        else 
            render json: { error: 'failed to edit brewery' }, status: :not_acceptable
        end 
    end 

end
