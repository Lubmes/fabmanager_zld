class RemoveColumnFromFabmoments < ActiveRecord::Migration[5.0]
  def change
  	remove_column :fabmoments, :images
  	remove_column :fabmoments, :project_files
  end
end
