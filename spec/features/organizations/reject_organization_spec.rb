require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
  let (:admin) { create(:user, :admin) }
  let (:org) { create(:organization) }

  it 'successfully rejects an organization' do
    log_in_as(admin)
    visit organization_path(org.id)
    click_on('Reject')
    expect(current_path).to eq(organizations_path)
    expect(page.body).to have_text('rejected')
  end

end
