class HotelController < ApplicationController

  # SHOW ALL HOTELS ON DASHBOARD
  def index
    @hotels = Hotel.all().order(:hotel_name)
    @hotelCategories = Hotel.get_hotel_categories
  end

  # SHOW INDIVIDUAL HOTEL PAGE
  def show
    @id = request.params[:id]

  end

  # FORM PAGE TO CREATE NEW HOTEL
  def new
    @hotel = Hotel.new()
    @hotelCats = Hotel.get_hotel_categories
  end

  # CREATE METHOD
  def create

  end

  # EDIT HOTEL
  def edit
    id = request.params[:id]
    @editHotel = Hotel.find(id)
    @hotelCats = Hotel.get_hotel_categories

  end

  # DESTROY METHOD
  def destroy
    id = request.params[:id]
    h = Hotel.find(id).destroy
		flash[:warning] = "Client #{ id } was successfully deleted."
		redirect_to action: :index
  end

  def checkHotel
    h = Hotel.where("hotel_name = :hotel", {:hotel => params[:hotel] } ).count
    if h != 0
      render :nothing => true, :status => 409
    else
      render :nothing => true, :status => 200
    end
    return
  end

end
