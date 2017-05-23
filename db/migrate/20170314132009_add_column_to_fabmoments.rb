class AddColumnToFabmoments < ActiveRecord::Migration[5.0]
  def change
  	add_column :fabmoments, :gingGoed, :text
  	add_column :fabmoments, :gingFout, :text
  	add_column :fabmoments, :kanBeter, :text
  end
end
