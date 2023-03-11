class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authorize

  


private 
  def authorize
    @current_user = User.find_by(id: session[:user_id])
    #return render json: { errors: errors.full_messages }, status: :unauthorized unless @current_user
    return render json: { errors: ["must be logged in"] }, status: :unauthorized unless @current_user
  end

end
