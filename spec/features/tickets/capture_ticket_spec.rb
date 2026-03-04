require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  let (:org_usr) { create(:user, :org) }
  let (:ticket) { create(:ticket, name: "FAKE") }

  it 'successfully captures a ticket' do
    log_in_as(org_usr)
    visit ticket_path(ticket.id)
    click_on('Capture')
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    expect(page.body).to have_text('Release')
  end

end
