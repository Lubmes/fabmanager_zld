class AddUsageToMachines < ActiveRecord::Migration[5.0]
  def change
    add_column :machines, :usage, :integer, :default => 0
  end
end
