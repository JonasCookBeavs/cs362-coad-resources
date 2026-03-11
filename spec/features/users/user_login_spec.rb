require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  let (:user) { create(:user) }

  it 'fails to log in' do
    visit new_user_session_path
    fill_in 'Email address', with: 'asd@gmail.com'
    fill_in 'Password', with: 'fake'
    click_on('Sign in')
    expect(current_path).to eq(new_user_session_path)
    expect(page.body).to have_text('Invalid')
  end

  it 'successfully logs in' do
    visit new_user_session_path
    fill_in 'Email address', with: user.email
    fill_in 'Password', with: user.password
    click_on('Sign in')
    expect(current_path).to eq(dashboard_path)
  end

end
