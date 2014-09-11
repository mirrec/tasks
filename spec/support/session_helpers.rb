module SessionHelpers
  def sign_in_user(user = nil)
    user = user || create(:user, password: 'password')

    visit signin_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'

    click_button 'Sign In'

    User.last
  end

  def expect_user_to_be_signed_in
    expect(page).to have_content 'Sign out'
  end

  def expect_user_to_be_signed_out
    expect(page).not_to have_content 'Sign out'
  end
end
