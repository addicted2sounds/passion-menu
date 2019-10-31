class HomeController < ApplicationController
  def index
    @token = auth_token&.token
  end

  private

  def auth_token
    return unless session[:user_id]
    Knock::AuthToken.new payload: { sub: session[:user_id] }
  end
end
