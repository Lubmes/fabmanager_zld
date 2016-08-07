class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.belongs_to :fabmoment, index: true
      t.belongs_to :material, index: true

      t.timestamps
    end
  end
end
