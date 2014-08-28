require 'rails_helper'
feature 'Doctor Search' do
  context 'index' do
    before do
      visit doctors_path
    end

    it "should have a different title" do
      expect(page).to have_css('h1', :text => 'All doctors')
    end
  end
end