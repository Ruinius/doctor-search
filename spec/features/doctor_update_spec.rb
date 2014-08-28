require 'rails_helper'
feature 'Doctor Search' do
  context 'update' do
    before do
      visit edit_doctor_path(@doctor1)
    end

    it "should not create a duplicate specialty" do
      fill_in('new_specialty', with: 'Primary Care')
      click_button 'Update Doctor'
      expect(@doctor1.specialties.count).to eq(1)
      expect(@doctor1.specialties.collect {|s| s.name}).to include('Primary Care')
      expect(Specialty.where(:name => 'Primary Care').count).to eq(1)
    end

    it "should add a new specialty" do
      fill_in('new_specialty', with: 'Cardiology')
      click_button 'Update Doctor'
      @doctor1.reload
      expect(@doctor1.specialties.count).to eq(2)
      expect(@doctor1.specialties.collect {|s| s.name}).to include('Cardiology')
      expect(Specialty.where(:name => 'Cardiology').count).to eq(1)
      expect(Specialty.count).to eq(3)
    end
  end
end