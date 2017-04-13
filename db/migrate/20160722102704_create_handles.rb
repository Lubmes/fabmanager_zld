class CreateHandles < ActiveRecord::Migration[5.0]
  def change
    create_table :handles do |t|
      t.belongs_to :fabmoment, show: true
      t.belongs_to :machine, show: true

      t.timestamps
    end
  end
end