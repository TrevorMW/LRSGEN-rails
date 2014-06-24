class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user
      t.string :user_email
      t.boolean :user_is_manager
      t.boolean :user_is_superadmin

      t.timestamps
    end
  end
end
