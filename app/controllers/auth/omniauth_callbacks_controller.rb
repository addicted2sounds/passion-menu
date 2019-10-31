module Auth
  class OmniauthCallbacksController < ApplicationController
    def create
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        session[:user_id] = @user.id
        redirect_to root_path
      else
        puts @user.errors
      end
    end
  end
end