require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'the add a review process' do
  it 'adds a new review' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    listing = FactoryGirl.create(:listing)
    visit listing_path(listing)
    click_link "Review this listing"
    fill_in "Review", :with => "Scummy"
    click_on "Create Review"
    expect(page).to have_content "Scummy"
  end
end
