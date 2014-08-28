require 'rails_helper'
feature 'Doctor Search' do
  context 'try to add existing specialty' do
    before do
      visit edit_doctor_path(@doctor1)
      fill_in('new_specialty', with: 'Primary Care')
      click_button 'Update Doctor'
    end

    it "should not add a new specialty to the doctor" do
      expect(@doctor1.specialties.count).to eq(1)
    end

    it "should not affect the existing specialty" do
      expect(@doctor1.specialties.collect {|s| s.name}).to include('Primary Care')
    end

    it "should not create a duplicate specialty" do
      expect(Specialty.where(:name => 'Primary Care').count).to eq(1)
    end
  end

  context 'add a new specialty' do
    before do
      visit edit_doctor_path(@doctor1)
      fill_in('new_specialty', with: 'Cardiology')
      click_button 'Update Doctor'
      @doctor1.reload
    end

    it "should increase the doctor's number of specialties" do
      expect(@doctor1.specialties.count).to eq(2)
    end

    it "should not affect the original specialty" do
      expect(@doctor1.specialty_list).to include('Primary Care')
    end

    it "should add the new specialty to the doctor" do
      expect(@doctor1.specialties.collect {|s| s.name}).to include('Cardiology')
    end

    it "should only create the new specialty once" do
      expect(Specialty.where(:name => 'Cardiology').count).to eq(1)
    end

    it "should increase the overall specialty count" do
      expect(Specialty.count).to eq(3)
    end

    it "should display the specialty for other doctors" do
      visit edit_doctor_path(@doctor2)
      expect(page).to have_content('Cardiology')
    end

    it "should allow the specialty to be added to other doctors" do
      visit edit_doctor_path(@doctor2)
      check 'Cardiology'
      click_button 'Update Doctor'
      @doctor2.reload
      expect(@doctor2.specialty_list).to include('Cardiology')
    end
  end
end