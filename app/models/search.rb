class Search 
  def initialize(address, specialty = "")
    @address = address
    @specialty = specialty
  end

  def nearby_doctors()
    # Doctors within 5 miles
    if @specialty.blank?
      Doctor.near(self.class.coordinates(@address), 5).sort_by {|d| d.distance}
    else
      Doctor.find_by(:specialty => @specialty).near(self.class.coordinates(@address), 5).sort_by {|d| d.distance}
    end
    
  end

  def self.coordinates(address)
    Geocoder.coordinates(address)
  end
end