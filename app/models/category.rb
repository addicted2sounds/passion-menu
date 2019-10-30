class Category < Section
  belongs_to :vertical, foreign_key: :parent_id
  has_many :courses

  enum state: %w[active]
end