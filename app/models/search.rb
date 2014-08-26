class Search 
  def initialize(address)
    @address = address
  end

  def nearby_doctors()
    # Doctors within 5 miles
    Doctor.near(self.class.coordinates(@address), 5).sort_by {|d| d.distance}
  end

  def self.coordinates(address)
    Geocoder.coordinates(address)
  end
end