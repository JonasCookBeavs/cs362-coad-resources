require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

  before do
    @region = create(:region)
    @resource_category = create(:resource_category)
  end

  it 'can be done from the home screen' do
    # Simulate user interaction with the page
    visit root_path
    click_on 'Get Help'
    fill_in 'Full Name', with: 'Test Name'
    fill_in 'Phone Number', with: '555-555-1234'
    select @region.name, from: 'Region'
    select @resource_category.name, from: 'Resource Category'
    fill_in 'Description', with: 'Test description'
    click_on 'Send this help request'

    # ... [expectations] ...
    expect(current_path).to eq ticket_submitted_path
  end

  it 'can fail when done from the home screen' do
    # Simulate user interaction with the page
    visit root_path
    click_on 'Get Help'
    click_on 'Send this help request'

    # ... [expectations] ...
    expect(current_path).to eq current_path
  end

  it 'can be done by going directly to the form' do
    visit new_ticket_path
    fill_in 'Full Name', with: 'Test Name'
    fill_in 'Phone Number', with: '555-555-1234'
    select @region.name, from: 'Region'
    select @resource_category.name, from: 'Resource Category'
    fill_in 'Description', with: 'Test description'
    click_on 'Send this help request'

    # ... [expectations] ...
    expect(current_path).to eq ticket_submitted_path
  end

  it 'can fail when going directly to the form' do
    visit new_ticket_path
    click_on 'Send this help request'

    # ... [expectations] ...
    expect(current_path).to eq current_path
  end
  
end
