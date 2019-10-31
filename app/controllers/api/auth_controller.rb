module Api
  class AuthController < ApiController
    def destroy
      session[:user_id] = nil
      head :ok
    end
  end
end
