class AdminNewsController < ActionController::API

    def index
        admin_news = AdminNew.all
        users = User.all
        admin_edits = AdminEdit.all
        render json: { breweries: admin_news, users: users, edits: admin_edits }
    end 

    def create
        @admin_new = {
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
        admin_new = AdminNew.create(@admin_new)
        if admin_new.valid? 
            render json: admin_new
        else 
            render json: { error: 'failed to create brewery' }, status: :not_acceptable
        end 
    end 

    def destroy
        brewery = AdminNew.find(params['id'])
        brewery.destroy
        breweries = AdminNew.all
        render json: breweries
    end 

end
