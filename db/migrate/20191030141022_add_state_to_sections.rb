class AddStateToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :state, :integer, default: 0
  end
end
