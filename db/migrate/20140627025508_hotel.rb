class Hotel < ActiveRecord::Migration
  def change
    add_column :hotels, :hotel_parking_fee, :integer
  end
end
