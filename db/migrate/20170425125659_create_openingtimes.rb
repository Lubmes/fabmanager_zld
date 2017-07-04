class CreateOpeningtimes < ActiveRecord::Migration[5.0]
  def change
    create_table :openingtimes do |t|
      t.string :title
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.string :sunday

      t.timestamps
    end
  end
end
