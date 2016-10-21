class AddImagesToFabmoments < ActiveRecord::Migration[5.0]
  def change
    add_column :fabmoments, :images, :text
  end
end