class Hotel < ActiveRecord::Migration
  def change
    add_column :hotels, :hotel_id, :integer
    add_column :hotels, :hotel_street, :string
    add_column :hotels, :hotel_city, :string
    add_column :hotels, :hotel_state, :string
    add_column :hotels, :hotel_zip, :string
    add_column :hotels, :hotel_phone, :string
    add_column :hotels, :hotel_email, :string

    add_column :hotels, :hotel_lat, :float
    add_column :hotels, :hotel_lng, :float

    add_column :hotels, :hotel_image_url, :string

    add_column :hotels, :hotel_pets, :boolean
    add_column :hotels, :hotel_pet_fee, :integer

    add_column :hotels, :hotel_smoking, :boolean
    add_column :hotels, :hotel_smoking_fee, :integer
  end
end
