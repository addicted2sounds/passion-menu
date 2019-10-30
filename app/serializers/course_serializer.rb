class CourseSerializer < ApplicationSerializer
  set_type :categories
  attributes :name, :author, :state, :category_id
end
