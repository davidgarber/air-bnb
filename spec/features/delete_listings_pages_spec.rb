require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "the delete a listing process" do
  it "deletes a listing" do
    visit '/'
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    listing = FactoryGirl.create(:listing)
    visit listing_path(listing)
    click_on 'Delete'
    expect(page).to have_content 'Listings'
  end
end
