class AddParentToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :parent_id, :bigint, index: true
    add_foreign_key :sections, :sections, column: :parent_id
  end
end
