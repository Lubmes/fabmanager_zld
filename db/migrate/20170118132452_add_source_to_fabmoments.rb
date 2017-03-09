class AddSourceToFabmoments < ActiveRecord::Migration[5.0]
  def change
  	add_column :fabmoments, :source, :string
  end
end
