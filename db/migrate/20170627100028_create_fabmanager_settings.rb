class CreateFabmanagerSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :fabmanager_settings do |t|
      t.time :max_time_to_occupy_machine
      t.integer :max_machines_to_occupy
      t.boolean :open_hour

      t.timestamps
    end
  end
end
