require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!


describe "create new listing" do
  it "creates a new listing" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit '/'
      click_link 'Add a new listing'
      fill_in 'Title', :with => 'Mansion'
      fill_in 'Description', :with => 'Really big house'
      fill_in 'Location', :with => 'Los Angeles'
      click_button 'Create Listing'
      expect(page).to have_content 'Listings'
  end

  it 'gives an error when no Title, Description or Location is entered' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit '/'
    click_link 'Add a new listing'
    click_button 'Create Listing'
    expect(page).to have_content 'errors'
  end
end
