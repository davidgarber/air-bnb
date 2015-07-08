require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "the edit a listing process" do
  it "edits a listing" do
    visit listings_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    listing = FactoryGirl.create(:listing)
    visit listing_path(listing)
    click_on 'Edit'
    fill_in 'Title', :with => "Shack"
    fill_in 'Description', :with => "A dump"
    fill_in 'Location', :with => "The res"
    click_on 'Update Listing'
    expect(page).to have_content "Shack"
  end
end
