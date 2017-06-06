class AddApprovedToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :approved, :boolean
  end
end
