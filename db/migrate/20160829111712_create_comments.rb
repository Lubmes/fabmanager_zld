class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :fabmoment, show: true, foreign_key: true
      t.references :author, show: true

      t.timestamps
    end

    add_foreign_key :comments, :users, column: :author_id
  end
end
