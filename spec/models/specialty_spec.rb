require 'rails_helper'

describe Specialty do
  it 'has a name' do
    expect(@specialty1.name).to eq('Primary Care')
  end

  it 'can belong to multiple doctors' do
    expect(@specialty1.doctors.count).to eq(2)
  end

  it 'can have multiple instances for a single doctor' do
    expect(@doctor2.specialties.count).to eq(2)
  end
end