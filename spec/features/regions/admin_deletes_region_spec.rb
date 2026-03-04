require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
  let (:admin) { create(:user, :admin) }
  let (:region) { create(:region, name: 'FAKE')}

  it 'successfully deletes a region' do
    log_in_as(admin)
    visit region_path(region.id)
    click_on('Delete')
    expect(current_path).to eq(regions_path)
    expect(page.body).to have_text('deleted')
  end

end
