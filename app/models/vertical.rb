class Vertical < Section
  has_many :categories, foreign_key: :parent_id, dependent: :destroy
end
