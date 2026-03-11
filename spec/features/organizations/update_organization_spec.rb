require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
  let (:org_usr) { create(:user, :org) }

  it 'successfully updates an organization' do
    log_in_as(org_usr)
    visit edit_organization_path(org_usr.organization_id)
    click_on('Update Resource')
    expect(current_path).to eq(organization_path(org_usr.organization_id))
  end

end
