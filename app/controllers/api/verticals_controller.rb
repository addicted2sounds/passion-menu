module Api
  class VerticalsController < ApplicationController
    def index
      @verticals = Vertical.all
      render json: VerticalSerializer.new(@verticals)
    end

    def create
      @vertical = Vertical.new vertical_params
      if @vertical.save
        render json: VerticalSerializer.new(@vertical)
      else
        render json: ErrorSerializer.new(@vertical.errors),
                     status: :unprocessable_entity
      end
    end

    private

    def vertical_params
      params.require(:data).require(:attributes)
            .permit(:name)
    end
  end
end
