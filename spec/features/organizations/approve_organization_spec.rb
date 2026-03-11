require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  let (:admin) { create(:user, :admin) }
  let (:org) { create(:organization) }

  it 'successfully approves an organization' do
    log_in_as(admin)
    visit organization_path(org.id)
    click_on('Approve')
    expect(current_path).to eq(organizations_path)
    expect(page.body).to have_text('approved')
  end

end
