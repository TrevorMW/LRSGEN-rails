class User < ActiveRecord::Migration
  def change
    add_column :users, :user_email, :string
    add_column :users, :user_is_manager, :boolean
    add_column :users, :user_is_superadmin, :boolean
  end
end
