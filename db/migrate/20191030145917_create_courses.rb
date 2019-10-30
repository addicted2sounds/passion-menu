class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :author
      t.references :category, index: true, foreign_key: { to_table: :sections }
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
