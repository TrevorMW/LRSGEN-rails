class HotelController < ApplicationController

  # SHOW ALL HOTELS ON DASHBOARD
  def index
    @hotels = Hotel.all()
    @hotelCategories = Hotel.select(:hotel_type).uniq
  end

  # SHOW INDIVIDUAL HOTEL PAGE
  def show
    @id = request.param[:id]
    
  end

  # FORM PAGE TO CREATE NEW HOTEL
  def new

  end

  # CREATE METHOD
  def create

  end

  # DESTROY METHOD
  def destroy


  end

end
