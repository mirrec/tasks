require 'spec_helper'

feature 'User signs up' do
  scenario 'with valid data' do
    visit signup_path

    fill_in 'Email', with: 'john.doe@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign Up'

    expect_user_to_be_signed_in
  end

  scenario 'with invalid data' do
    visit signup_path

    click_button 'Sign Up'

    expect_user_to_be_signed_out
    expect(page).to have_css '.form-errors'
  end
end
