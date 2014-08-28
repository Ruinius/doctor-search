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
    # Doctors within 5 miles; results are sorted due to 'near' keyword
    #display 10 but retrieve 11 to easily determine if there are more
    if @specialty_id.zero?
      Doctor.near(self.class.coordinates(@address), 5).limit(11)
    else
      Doctor.joins(:specialties).where(:specialties => {:id => @specialty_id}).near(self.class.coordinates(@address), 5).limit(11)
    end
  end

  def self.coordinates(address)
    Geocoder.coordinates(address)
  end
end