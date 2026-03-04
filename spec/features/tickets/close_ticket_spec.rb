require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
  let (:admin) { create(:user, :admin) }
  let (:org_usr) { create(:user, :org) }
  let (:ticket) { create(:ticket) }

  it 'successfully closes a ticket as an admin' do
    log_in_as(admin)
    visit ticket_path(ticket.id)
    click_on('Close')
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    expect(page.body).to have_text('Closed')
  end

    it 'successfully closes a ticket as an organization user' do
    log_in_as(org_usr)
    visit ticket_path(ticket.id)
    click_on('Capture')
    visit ticket_path(ticket.id)
    click_on('Close')
    expect(current_path).to eq(dashboard_path)
    visit ticket_path(ticket.id)
    expect(page.body).to have_text('Closed')
  end

end
