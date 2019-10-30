module Api
  class VerticalsController < ApplicationController
    def index
      @verticals = Vertical.all
      render json: VerticalSerializer.new(@verticals)
    end
  end
end
