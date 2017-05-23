class AddCapacityToMachine < ActiveRecord::Migration[5.0]
  def change
    add_column :machines, :capacity, :integer
  end
end
