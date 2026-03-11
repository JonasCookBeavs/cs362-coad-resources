require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
  let (:admin) { create(:user, :admin) }
  let (:res_cat) { create(:resource_category, name: "FAKE") }

  it 'successfully deletes a resource category as an admin' do
    log_in_as(admin)
    visit resource_categories_path(res_cat.id)
    click_on('FAKE')
    click_on('Delete')
    expect(current_path).to eq(resource_categories_path)
    expect(page.body).to have_text('deleted')
  end

end
