class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :insertion, :string
    add_column :users, :lastname, :string
    add_column :users, :biography, :string
    add_column :users, :telephone, :string
  end
end
#rails generate migration add_columns_to_users firstname:string insertion:string lastname:string biography:string telephone:string