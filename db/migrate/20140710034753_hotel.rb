class Hotel < ActiveRecord::Migration
  def change
    remove_column :hotels, :hotel_current_rate, :int
    add_column :hotels, :hotel_current_rate, :string
    add_column :hotels, :hotel_concierge, :string
  end
end
