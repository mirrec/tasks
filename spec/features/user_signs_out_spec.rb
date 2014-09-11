require 'spec_helper'

feature 'User signs out' do
  scenario 'by clicking on sign out link' do
    sign_in_user

    expect_user_to_be_signed_in

    click_link 'Sign out'

    expect_user_to_be_signed_out
  end
end
