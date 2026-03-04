require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  let (:admin) { create(:user, :admin) }
  let (:ticket) { create(:ticket) }

  it 'successfully deletes a ticket' do
    log_in_as(admin)
    visit ticket_path(ticket.id)
    click_on('Delete')
    expect(current_path).to eq(dashboard_path)
    expect(page.body).to have_text('deleted')
  end

end
