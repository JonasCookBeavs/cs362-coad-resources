require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

  it 'successfully signs up' do
    visit signup_path
    fill_in 'Email address', with: 'asd@gmail.com'
    fill_in 'Password', with: 'fakepass'
    fill_in 'Password confirmation', with: 'fakepass'
    within('#new_user') { click_on('Sign up') }
    expect(current_path).to eq(root_path)
  end

  it 'fails to signs up with short password' do
    visit signup_path
    fill_in 'Email address', with: 'asd@gmail.com'
    fill_in 'Password', with: 'fake'
    fill_in 'Password confirmation', with: 'fake'
    within('#new_user') { click_on('Sign up') }
    expect(current_path).to eq(user_registration_path)
  end

  it 'fails to signs up with non-mathcing passwords' do
    visit signup_path
    fill_in 'Email address', with: 'asd@gmail.com'
    fill_in 'Password', with: 'fakepass'
    fill_in 'Password confirmation', with: 'fakepass1'
    within('#new_user') { click_on('Sign up') }
    expect(current_path).to eq(user_registration_path)
  end

  it 'fails to signs up with invalid email' do
    visit signup_path
    fill_in 'Email address', with: 'asd'
    fill_in 'Password', with: 'fakepass'
    fill_in 'Password confirmation', with: 'fakepass'
    within('#new_user') { click_on('Sign up') }
    expect(current_path).to eq(user_registration_path)
  end

end
