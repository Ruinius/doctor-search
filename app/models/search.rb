class Search 
  def initialize(address, specialty_id = 0)
    @address = address
    @specialty_id = specialty_id.to_i
  end

  def nearby_doctors()
    # Doctors within 5 miles
    if @specialty_id.zero?
      Doctor.near(self.class.coordinates(@address), 5).sort_by {|d| d.distance}
    else
      Doctor.joins(:specialties).where(:specialties => {:id => @specialty_id}).near(self.class.coordinates(@address), 5).sort_by {|d| d.distance}
    end
    
  end

  def self.coordinates(address)
    Geocoder.coordinates(address)
  end
end