class CreateEventMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :event_machines do |t|
      t.belongs_to :event, index: true
      t.belongs_to :machine, index: true

      t.timestamps
    end
  end
end
