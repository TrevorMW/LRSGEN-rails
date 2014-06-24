class Reservation < ActiveRecord::Migration
  def change
    add_column :reservations, :hotel_id, :string
    add_column :reservations, :visitor_name, :string
    add_column :reservations, :visitor_street, :string
    add_column :reservations, :visitor_city, :string
    add_column :reservations, :visitor_state, :string
    add_column :reservations, :visitor_zip, :string
    add_column :reservations, :room_type, :string
    add_column :reservations, :nights, :integer
    add_column :reservations, :rooms, :integer
    add_column :reservations, :adults, :integer
    add_column :reservations, :children, :integer
    add_column :reservations, :pets, :boolean
    add_column :reservations, :smoking, :boolean
  end
end
