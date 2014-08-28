require 'rails_helper'

RSpec.describe Doctor, :type => :model do
  it "should have a first name" do
    expect(@doctor1.first_name).to eq('Nina')
  end

  it "should have a last name" do
    expect(@doctor1.last_name).to eq('Fallick')
  end

  it "should have a street" do
    expect(@doctor1.street).to eq('241 East 86th St')
  end

  it "should have an optional unit" do
    expect(@doctor1.unit).to eq('Suite 100')
    expect(@doctor2.unit).to eq('')
  end

  it "should have a city" do
    expect(@doctor1.city).to eq('New York')
  end

  it "should have a state" do
    expect(@doctor1.state).to eq('NY')
  end

  it "should have a zip code" do
    expect(@doctor1.zip).to eq('10028')
  end

  it "should have a full address" do
    expect(@doctor1.full_address).to eq('241 East 86th St Suite 100, New York, NY 10028')
  end
end
