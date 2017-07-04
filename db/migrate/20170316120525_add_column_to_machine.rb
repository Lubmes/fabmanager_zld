class AddColumnToMachine < ActiveRecord::Migration[5.0]
  def change
    add_column :machines, :schedule, :text
  end
end
