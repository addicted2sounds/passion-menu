class HomeController < ApplicationController
  def index
    @token = auth_token.token if session[:user_id].present?
  end

  private

  def auth_token
    Knock::AuthToken.new(payload: { sub: session[:user_id] })
  end
end
