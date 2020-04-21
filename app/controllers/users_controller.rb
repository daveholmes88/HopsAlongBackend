require 'jwt'

class UsersController < ApplicationController

    def create
        user = User.find_by(username: params['username'])
        if user
            payload = { user_id: user.id }
            token = JWT.encode(payload, 'secret', 'HS256')
            if user && user.authenticate(params[:password])
                render json: { id: user.id, username: user.username, token: token }
            else 
                render json: { error: 'Invalid Credentials' }, status: 401
            end
        else  
            @user = User.create(username: params['username'], password: params['password'])
            payload = { user_id: @user.id }
            token = JWT.encode(payload, 'secret', 'HS256')
            if @user.valid?
                render json: { id: @user.id, username: @user.username, token: token }, status: :created
            else
                render json: { error: 'failed to create user' }, status: :not_acceptable
            end
        end 
    end

    def index
        breweries = Brewery.all 
        ratings = Rating.all
        token = request.headers[:Authorization].split(' ')[1]
        decoded_token = JWT.decode token, 'secret', true, { algorithm: 'HS256' }
        user_id = decoded_token[0]['user_id']
        user = User.find(user_id)
        if user 
            render json: { user: {id: user.id, username: user.username}, ratings: ratings, breweries: breweries }
        else 
            render json: { error: 'Invalid Credentials' }, status: 401
        end 
    end 

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end
