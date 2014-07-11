class Rates < ActiveRecord::Base

  def self.saveCells( params )
    h = Hotel.find( params[:id] )
    if params[:field]  == 'hotel_concierge'
      h.hotel_concierge = params[:val]
    else
      h.hotel_current_rate = params[:val]
    end
    h.save()
    return h.new_record?
  end

end
