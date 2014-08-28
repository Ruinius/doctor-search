require 'rails_helper'

RSpec.describe Doctor, :type => :model do
  it "should have a first name" do
    expect(@doctor1.first_name).to eq('Nina')
  end
end
