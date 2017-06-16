class AddColumnsToFabmoments < ActiveRecord::Migration[5.0]
  def change
    add_column :fabmoments, :likes, :integer, :default => 0
    add_column :fabmoments, :staff_pick, :boolean, :default => false
  end
end
