class CategorySerializer < ApplicationSerializer
  set_type :categories
  attributes :name, :state, :parent_id
end
