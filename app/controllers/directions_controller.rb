class DirectionsController < ApplicationController

  def index
    h = Hotel.find( request.params[:hotel_id] )
    @coords = { :lat => h.hotel_lat, :lng => h.hotel_lng }.to_json
  end

end
