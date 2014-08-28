# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  DatabaseCleaner.strategy = :truncation

  config.after(:all) do
    DatabaseCleaner.clean
  end

  config.before(:each) do
    @specialty1 = Specialty.create({name: 'Primary Care'})
    @specialty2 = Specialty.create({name: 'Endocrinology'})

    @doctor1 = Doctor.create({first_name: 'Nina', 
               last_name: 'Fallick', 
               street: '241 East 86th St',
               unit: '',
               city: 'New York',
               state: 'NY',
               zip: '10028',
               phone: '212-426-0190'})

    # @doctor2 = Doctor.create({first_name: 'Ricardo', 
    #            last_name: 'Issa', 
    #            street: '157 E 72nd St',
    #            unit: '',
    #            city: 'New York',
    #            state: 'NY',
    #            zip: '10021',
    #            phone: '212-772-1211'})

    # @doctor3 = Doctor.create({first_name: 'Ronald', 
    #            last_name: 'Primas', 
    #            street: '952 Fifth Avenue',
    #            unit: '',
    #            city: 'New York',
    #            state: 'NY',
    #            zip: '10075',
    #            phone: '212-737-1212'})

    # @doctor4 = Doctor.create({first_name: 'Harry', 
    #            last_name: 'Gruenspan', 
    #            street: '1317 3rd Ave',
    #            unit: '',
    #            city: 'New York',
    #            state: 'NY',
    #            zip: '10021',
    #            phone: '212-794-2900'})

    # @doctor5 = Doctor.create({first_name: 'Lynn', 
    #            last_name: 'Ratner', 
    #            street: '112 East 83rd St',
    #            unit: '',
    #            city: 'New York',
    #            state: 'NY',
    #            zip: '10028',
    #            phone: '212-396-0400'})

    # @doctor6 = Doctor.create({first_name: 'Orit', 
    #            last_name: 'Beitner', 
    #            street: '211 Central Park West',
    #            unit: '',
    #            city: 'New York',
    #            state: 'NY',
    #            zip: '10024',
    #            phone: '212-877-3210'})

    # @doctor7 = Doctor.create({first_name: 'Robert', 
    #            last_name: 'Romanoff', 
    #            street: '115 Central Park West',
    #            unit: '',
    #            city: 'New York',
    #            state: 'NY',
    #            zip: '10023',
    #            phone: '212-866-2100'})

    # @doctor8 = Doctor.create({first_name: 'Athanasios', 
    #            last_name: 'Mallios', 
    #            street: '15 West 82nd St',
    #            unit: '',
    #            city: 'New York',
    #            state: 'NY',
    #            zip: '10023',
    #            phone: '212-787-0091'})

    # @doctor9 = Doctor.create({first_name: 'Richard', 
    #            last_name: 'Shepard', 
    #            street: '140 West 69th St',
    #            unit: '',
    #            city: 'New York',
    #            state: 'NY',
    #            zip: '10023',
    #            phone: '212-496-9620'})

    # @doctor10 = Doctor.create({first_name: 'Haleh', 
    #            last_name: 'Milani', 
    #            street: '115 Central Park West',
    #            unit: '',
    #            city: 'New York',
    #            state: 'NY',
    #            zip: '10463',
    #            phone: '212-543-3400'})

    @doctor2 = Doctor.create({first_name: 'Gillian', 
               last_name: 'Goddard', 
               street: '103 East 75th St',
               unit: '',
               city: 'New York',
               state: 'NY',
               zip: '10021',
               phone: '212-772-7628'})

    DoctorSpecialty.create({doctor_id: @doctor1.id, specialty_id: @specialty1.id})
    #DoctorSpecialty.create({doctor_id: @doctor2.id, specialty_id: @specialty1.id})
    #DoctorSpecialty.create({doctor_id: @doctor3.id, specialty_id: @specialty1.id})
    #DoctorSpecialty.create({doctor_id: @doctor4.id, specialty_id: @specialty1.id})
    #DoctorSpecialty.create({doctor_id: @doctor5.id, specialty_id: @specialty1.id})
    #DoctorSpecialty.create({doctor_id: @doctor6.id, specialty_id: @specialty1.id})
    #DoctorSpecialty.create({doctor_id: @doctor7.id, specialty_id: @specialty1.id})
    #DoctorSpecialty.create({doctor_id: @doctor8.id, specialty_id: @specialty1.id})
    #DoctorSpecialty.create({doctor_id: @doctor9.id, specialty_id: @specialty1.id})
    #DoctorSpecialty.create({doctor_id: @doctor10.id, specialty_id: @specialty1.id})
    DoctorSpecialty.create({doctor_id: @doctor2.id, specialty_id: @specialty2.id})
  end
end
