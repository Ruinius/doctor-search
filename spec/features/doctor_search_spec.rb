require 'rails_helper'
feature 'Doctor Search' do
  context 'search' do
    before do
      visit search_path
    end

    it "displays the search form" do
      expect(page).to have_css('form')
      expect(page).to have_content('New physician search')
    end

    it "requires an address" do
      click_button 'Search'
      expect(page).to have_content('Please enter an address')
    end

    it "performs an address search" do
      fill_in('address', with: '242 E 81st St, New York, NY')
      click_button 'Search'
      expect(page).to have_content(@doctor1.last_name)
      expect(page).to have_content(@doctor2.full_address)
    end

    it "performs a zip code search" do
      fill_in('zipcode', with: '10028')
      click_button 'Search'
      expect(page).to have_content(@doctor1.full_address)
      expect(page).to have_content(@doctor2.last_name)
    end

    it "performs a search including a specialty" do
      fill_in('zipcode', with: '10028')
      select 'Endocrinology', :from => 'specialty_id'
      click_button 'Search'
      expect(page).to have_content(@doctor2.full_address)
      expect(page).to have_content(@doctor2.last_name)
      expect(page).to have_no_content(@doctor1.last_name)
    end
  end
end