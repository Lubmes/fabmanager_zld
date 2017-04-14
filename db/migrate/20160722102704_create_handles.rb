class CreateHandles < ActiveRecord::Migration[5.0]
  def change
    create_table :handles do |t|
      t.belongs_to :fabmoment, index: true
      t.belongs_to :machine, index: true

      t.timestamps
    end
  end
end