require 'rails_helper'

describe Specialty do
  it 'has a name' do
    expect(@specialty1.name).to eq('Primary Care')
  end
end