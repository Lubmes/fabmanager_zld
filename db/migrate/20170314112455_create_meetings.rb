class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :rails
      t.string :g
      t.string :scaffold
      t.string :Meeting
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :calendar

      t.timestamps
    end
  end
end
