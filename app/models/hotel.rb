class Hotel < ActiveRecord::Base

  def self.get_hotel_categories
    @hotelCats = Hotel.select(:hotel_type).uniq.order(:hotel_type)
  end

end
