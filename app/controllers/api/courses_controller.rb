module Api
  class CoursesController < ApiController
    before_action :set_category, only: %i[index create]
    before_action :set_course, only: %i[show update destroy]
    def index
      render json: CourseSerializer.new(@category.courses)
    end

    def create
      render CreateRecordService.new(
        @category.courses.build(course_params),
        serializer: CourseSerializer
      ).call
    end

    def update
      if @course.update course_params
        render json: CourseSerializer.new(@course)
      else
        render json: ErrorSerializer.new(@course.errors),
                     status: :unprocessable_entity
      end
    end

    def destroy
      @course.destroy
      render head: :ok
    end

    private

    def course_params
      params.require(:data).require(:attributes)
            .permit(:name, :author, :category_id)
    end

    def set_category
      @category = Category.find params[:category_id]
    end

    def set_course
      @course = Course.find params[:id]
    end
  end
end
