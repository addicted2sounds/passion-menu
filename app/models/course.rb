class Course < ApplicationRecord
  belongs_to :category
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :author, presence: true

  enum state: %w[active]
end
