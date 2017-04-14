class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :occupation do |t|
      t.text :description
      t.datetime :begin_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
