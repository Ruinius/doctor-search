json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :first_name, :last_name, :street, :unit, :city, :state, :zip, :phone, :specialty
  json.url doctor_url(doctor, format: :json)
end
