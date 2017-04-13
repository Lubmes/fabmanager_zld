class CreateInterfaces < ActiveRecord::Migration[5.0]
  def change
    create_table :interfaces do |t|
      t.belongs_to :fabmoment, show: true
      t.belongs_to :program, show: true

      t.timestamps
    end
  end
end
