class CreateUsageDurations < ActiveRecord::Migration[5.0]
  def change
    create_table :usage_durations do |t|

      t.column :duration, :time

      t.timestamps
    end
  end
  add_reference :machines, :usage_duration, index: true
end
