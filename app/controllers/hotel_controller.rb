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


  # CHECK TO SEE IF HOTEL NAME EXISTS
  def checkHotel
    h = Hotel.where("hotel_name = :hotel", {:hotel => params[:hotel] } ).count
    if h != 0
      render :nothing => true, :status => 409
    else
      render :nothing => true, :status => 200
    end
    return
  end


  # ANONYMOUS IMGUR API UPLOAD THAT RETURNS JSON
  def upload
    name = request.params[:image_name]
    @api_key = '647a88812a5dc2a'
    c = Curl::Easy.new("http://imgur.com/api/upload.json")
    c.multipart_form_post = true
    c.http_post( Curl::PostField.content('key', @api_key),
                 Curl::PostField.file('image', name ) )
    response = Crack::JSON.parse c.body_str
    raise ImgurError, response["rsp"]["error_msg"] if response["rsp"]["stat"] == "fail"
    return response
  end


end
