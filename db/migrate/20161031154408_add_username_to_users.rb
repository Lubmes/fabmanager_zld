class AddUsernameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
  end
end
#rails generate migration add_username_to_users username:string