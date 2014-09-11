require 'spec_helper'

feature 'User signs in' do
  scenario 'with valid data' do
    user = create(:user, email: 'john.doe@example.com', password: 'password')

    visit signin_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect_user_to_be_signed_in
  end

  scenario 'with invalid data' do
    user = create(:user, password: 'password')

    visit signin_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrong password'
    click_button 'Sign In'

    expect_user_to_be_signed_out
    expect(page).to have_css '.form-errors'
  end
end
