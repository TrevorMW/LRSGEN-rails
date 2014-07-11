class RatesController < ApplicationController

  def index
    @hotels = Hotel.select(:id, :hotel_name, :hotel_phone, :hotel_type, :hotel_concierge, :hotel_current_rate).order(:hotel_name)
  end

  def saveCells
    h = Rates.saveCells( request.params )
    if h == 0
      render :nothing => true, :status => 409
    else
      render json: h, :status => 200
    end
  end

end
