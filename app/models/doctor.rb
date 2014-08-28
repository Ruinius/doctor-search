class Doctor < ActiveRecord::Base
  has_many :doctor_specialties
  has_many :specialties, through: :doctor_specialties
  geocoded_by :full_address
  after_validation :geocode
  accepts_nested_attributes_for :doctor_specialties
  
  def full_address
    "#{street_address}, #{city}, #{state} #{zip}"
  end

  def street_address
    unit.blank? ? street : "#{street} #{unit}"
  end

  def specialty_list
    self.specialties.collect {|s| s.name}.join(", ")
  end
end
