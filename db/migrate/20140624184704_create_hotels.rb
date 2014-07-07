class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string   :hotel_name
      t.string   :hotel_street
      t.string   :hotel_city
      t.string   :hotel_state
      t.string   :hotel_zip
      t.string   :hotel_phone
      t.string   :hotel_email
      t.float    :hotel_lat
      t.float    :hotel_lng
      t.string   :hotel_image_url
      t.boolean  :hotel_pets
      t.integer  :hotel_pet_fee
      t.boolean  :hotel_smoking
      t.integer  :hotel_smoking_fee
      t.string   :hotel_type
      t.string   :hotel_region
      t.integer  :hotel_parking_fee
      t.timestamps
    end
  end
end
