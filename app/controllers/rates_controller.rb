class RatesController < ApplicationController

  def index
    @hotels = Hotel.select(:id, :hotel_name, :hotel_phone, :hotel_concierge, :hotel_current_rate)

  end

  def save_editable_cell
    

  end

end
