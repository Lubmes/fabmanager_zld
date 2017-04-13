class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.belongs_to :fabmoment, show: true
      t.belongs_to :material, show: true

      t.timestamps
    end
  end
end
