module Api
  class CategoriesController < ApplicationController
    before_action :set_vertical, only: %w[index create]
    before_action :set_category, only: %w[update destroy]

    def index
      render json: CategorySerializer.new(@vertical.categories)
    end

    def create
      @category = @vertical.categories.build category_params
      if @category.save
        render json: CategorySerializer.new(@category)
      else
        render json: ErrorSerializer.new(@category.errors),
                     status: :unprocessable_entity
      end
    end

    def update
      if @category.update category_params
        render json: CategorySerializer.new(@category)
      else
        render json: ErrorSerializer.new(@category.errors),
                     status: :unprocessable_entity
      end
    end

    def destroy
      @category.destroy
      render head: :ok
    end

    private

    def set_vertical
      @vertical = Vertical.find params[:vertical_id]
    end

    def set_category
      @category = Category.find params[:id]
    end

    def category_params
      params.require(:data).require(:attributes)
            .permit(:name)
    end
  end
end