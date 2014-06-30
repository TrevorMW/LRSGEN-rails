class DirectionsController < ApplicationController

  def index
    id = request.params[:hotel_id]
    h = Hotel.find(id)
    @coords = { :lat => h.hotel_lat, :lng => h.hotel_lng }.to_json
  end

end
