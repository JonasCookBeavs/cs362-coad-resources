require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
  let (:org_usr) { create(:user, :org) }
  let (:ticket) { create(:ticket) }

  it 'successfully releases a ticket as an organization user' do
    log_in_as(org_usr)
    visit ticket_path(ticket.id)
    click_on('Capture')
    org_name = ticket.organization
    visit ticket_path(ticket.id)
    click_on('Release')
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    expect(page.body).to have_text('Capture')
  end

end
