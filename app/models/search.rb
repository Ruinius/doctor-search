class Search 
  def initialize(params)
    if !params[:address].blank?
      @address = params[:address]
    elsif !params[:zipcode].blank?
      @address = params[:zipcode]
    end
    @specialty_id = params[:id].to_i
  end

  def nearby_doctors()
    # Doctors within 5 miles
    if @specialty_id.zero?
      Doctor.near(self.class.coordinates(@address), 5).limit(11).sort_by {|d| d.distance}
    else
      Doctor.joins(:specialties).where(:specialties => {:id => @specialty_id}).near(self.class.coordinates(@address), 5).limit(11).sort_by {|d| d.distance}
    end
  end

  def self.coordinates(address)
    Geocoder.coordinates(address)
  end
end