class CreateProjectFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :project_files do |t|
      	t.string :name
      	t.belongs_to :fabmoment, show: true
      	t.timestamps
    end

    add_attachment :project_files, :file
  end
end
