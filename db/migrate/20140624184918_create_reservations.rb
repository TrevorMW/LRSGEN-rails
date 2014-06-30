class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :reservation
      t.string :hotel_id
      t.string :visitor_name
      t.string :visitor_street
      t.string :visitor_city
      t.string :visitor_state
      t.string :visitor_zip
      t.string :room_type
      t.integer :nights
      t.integer :rooms
      t.integer :adults
      t.integer :children
      t.boolean :pets
      t.boolean :smoking
      t.timestamps
    end
  end
end
