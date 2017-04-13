class AddAuthorToFabmoments < ActiveRecord::Migration[5.0]
  def change
    add_reference :fabmoments, :author, show: true
    add_foreign_key :fabmoments, :users, column: :author_id 
  end
end
