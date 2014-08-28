require 'rails_helper'
feature 'Doctor Search' do
  context 'index' do
    before do
      visit doctors_path
    end

    it "should have a different title" do
      expect(page).to have_css('h1', :text => 'All doctors')
    end

    it "should display each doctor" do
      expect(page).to have_css('td', :text => 'Nina')
      expect(page).to have_css('td', :text => 'Fallick')
      expect(page).to have_css('td', :text => 'Gillian')
      expect(page).to have_css('td', :text => 'Goddard')
    end

    it "should display doctors' addresses" do
      expect(page).to have_css('td', :text => '241 East 86th St Suite 100, New York, NY 10028')
    end

    it "should display doctors' phones" do
      expect(page).to have_css('td', :text => '212-772-7628')
    end

    it "should display doctors' specialties" do
      expect(page).to have_css('td', :text => 'Primary Care, Endocrinology')
    end
  end
end