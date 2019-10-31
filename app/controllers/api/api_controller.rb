module Api
  class ApiController < ActionController::API
    include Knock::Authenticable
    before_action :authenticate_user

    protected

    def not_found
      session[:user_id] = nil
      head :not_found
    end
  end
end
