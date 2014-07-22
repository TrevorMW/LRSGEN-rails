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

    h = Hotel.create( hotel_params )
    h.save()

    respond_to do |r|
      r.html{ redirect_to action: :index }
    end

  end


  # EDIT HOTEL
  def edit
    h = Hotel.find( request.params[:id] )
    @hotel = h
    @hotelCats = Hotel.get_hotel_categories
    @coords = { :lat => h.hotel_lat, :lng => h.hotel_lng }.to_json
  end


  def update


  end


  # DESTROY METHOD
  def destroy
    id = request.params[:id]
    h = Hotel.find(id).destroy
		flash[:warning] = "Client #{ id } was successfully deleted."
		redirect_to action: :index
  end


  def hotel_params()
      params.require(:hotel).permit(:hotel_name,:hotel_street,:hotel_city,:hotel_state,:hotel_zip,:hotel_phone,
                                    :hotel_email,:hotel_lat,:hotel_lng,:hotel_image_url,:hotel_pets,
                                    :hotel_pet_fee,:hotel_smoking,:hotel_smoking_fee,:hotel_type,
                                    :hotel_region,:hotel_parking_fee,:hotel_current_rate,:hotel_concierge )
  end


  # CHECK TO SEE IF HOTEL NAME EXISTS
  def checkHotel
    h = Hotel.checkHotel( params[:hotel] )
    if h != 0
      render :nothing => true, :status => 409
    else
      render :nothing => true, :status => 200
    end
    return
  end


  # ANONYMOUS IMGUR API UPLOAD THAT RETURNS JSON
  def upload
    respond_to do ||
      name = params[:image_name]
      @api_key = '647a88812a5dc2a'
      c = Curl::Easy.new("http://imgur.com/api/upload.json")
      c.multipart_form_post = true
      c.http_post( Curl::PostField.content('key', @api_key),
                   Curl::PostField.file('image', name ) )
      response = Crack::JSON.parse c.body_str
      raise ImgurError, response["rsp"]["error_msg"] if response["rsp"]["stat"] == "fail"
    end
  end


end
