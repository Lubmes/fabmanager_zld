class RemoveLikesFromFabmoments < ActiveRecord::Migration[5.0]
  def change
    remove_column :fabmoments, :likes
  end
end
