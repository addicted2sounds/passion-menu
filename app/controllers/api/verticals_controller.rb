module Api
  class VerticalsController < ApplicationController
    before_action :set_vertical, only: %i[show update destroy]
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

    def update
      if @vertical.update vertical_params
        render json: VerticalSerializer.new(@vertical)
      else
        render json: ErrorSerializer.new(@vertical.errors),
                     status: :unprocessable_entity
      end
    end

    def destroy
      @vertical.destroy
      render head: :ok
    end

    private

    def vertical_params
      params.require(:data).require(:attributes)
            .permit(:name)
    end

    def set_vertical
      @vertical = Vertical.find params[:id]
    end
  end
end
