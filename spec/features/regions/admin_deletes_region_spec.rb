require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
  let (:admin) { create(:user, :admin) }
  
  it "deletes a region", js: true do
  region = Region.create!(name: "FAKE")
  log_in_as(admin)

  visit regions_path

  accept_confirm do
    # Often the delete link is near the region name
    within(:xpath, "//*[contains(., 'FAKE')]") do
      click_on(/Delete|Destroy|Remove/i)
    end
  end

  expect(current_path).to eq(regions_path)
  expect(page).not_to have_text("FAKE")
end
end
