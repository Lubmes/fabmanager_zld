class CreateInterfaces < ActiveRecord::Migration[5.0]
  def change
    create_table :interfaces do |t|
      t.belongs_to :fabmoment, index: true
      t.belongs_to :program, index: true

      t.timestamps
    end
  end
end
