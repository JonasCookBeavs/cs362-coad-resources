require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
  let (:admin) { create(:user, :admin) }
  
  it "deletes a region" do
    region = create(:region, name: "FAKE") # or Region.create!(name: "FAKE")
    log_in_as(admin)

    visit regions_path
    expect(page).to have_text("FAKE")

    # Option A: the button/link is literally labeled "Delete"
    accept_confirm do
      click_on "Delete", match: :first
    end

    expect(page).not_to have_text("FAKE")
    expect(Region.exists?(region.id)).to be(false)
  end
end
