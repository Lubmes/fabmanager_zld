class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
    	t.string :name
    	t.references :imageable, polymorphic: true, show: true
    	t.timestamps
    end

    add_attachment :pictures, :image
  end
end