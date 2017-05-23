class CreateRentings < ActiveRecord::Migration[5.0]
  def change
    create_table :rentings do |t|
      t.text :description
      t.timestamps
    end
  end
end
