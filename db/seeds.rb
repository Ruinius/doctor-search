# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
specialties = Specialty.create([{name: 'Primary Care'},{name: 'Endocrinology'}])
doctors = []
doctors << Doctor.create({first_name: 'Nina', 
               last_name: 'Fallick', 
               street: '241 East 86th St',
               unit: '',
               city: 'New York',
               state: 'NY',
               zip: '10028',
               phone: '212-426-0190'})

doctors << Doctor.create({first_name: 'Ricardo', 
               last_name: 'Issa', 
               street: '157 E 72nd St',
               unit: '',
               city: 'New York',
               state: 'NY',
               zip: '10021',
               phone: '212-772-1211'})

doctors << Doctor.create({first_name: 'Ronald', 
               last_name: 'Primas', 
               street: '952 Fifth Avenue',
               unit: '',
               city: 'New York',
               state: 'NY',
               zip: '10075',
               phone: '212-737-1212'})

doctors << Doctor.create({first_name: 'Harry', 
               last_name: 'Gruenspan', 
               street: '1317 3rd Ave',
               unit: '',
               city: 'New York',
               state: 'NY',
               zip: '10021',
               phone: '212-794-2900'})

doctors << Doctor.create({first_name: 'Lynn', 
               last_name: 'Ratner', 
               street: '112 East 83rd St',
               unit: '',
               city: 'New York',
               state: 'NY',
               zip: '10028',
               phone: '212-396-0400'})

doctors << Doctor.create({first_name: 'Gillian', 
               last_name: 'Goddard', 
               street: '103 East 75th St',
               unit: '',
               city: 'New York',
               state: 'NY',
               zip: '10021',
               phone: '212-772-7628'})

DoctorSpecialty.create({doctor_id: doctors.last.id, specialty_id: specialties.last.id})
doctors[0..4].each do |doctor|
  DoctorSpecialty.create({doctor_id: doctor.id, specialty_id: specialties.first.id}) 
end