class Category < Section
  belongs_to :vertical, foreign_key: :parent_id
  enum state: %w[active]
end