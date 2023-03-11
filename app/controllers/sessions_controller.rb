class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id 
            render json: user, status: :created
        elsif user
            render json: {error: "invalid username or password"}, status: :unauthorized
        else
            render json: {errors: ["needs unique username"]}, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

end