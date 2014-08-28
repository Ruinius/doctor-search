require 'rails_helper'
feature 'Doctor Search' do
  context 'search' do
    before do
      visit search_path
    end

    it "performs an address search" do
      fill_in('address', with: '242 E 81st St, New York, NY')
      click_button 'Search'

      expect(page).to have_content(@doctor1.last_name)
      expect(page).to have_content(@doctor2.full_address)
    end
  end
end