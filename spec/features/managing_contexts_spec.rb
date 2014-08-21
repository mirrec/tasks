require 'spec_helper'

feature 'Managing contexts' do
  scenario 'creating context' do
    visit root_path
    click_link 'Add new context'

    fill_in 'Name', with: 'My Context'
    click_button 'Create Context'

    expect(page).to have_content 'My Context'
  end

  scenario 'editing context' do
    context = create(:context, name: 'My Context')

    visit context_path(context)
    click_link 'Edit Context'

    fill_in 'Name', with: 'New context name'
    click_button 'Update Context'

    expect(page).to have_content 'New context name'
  end

  scenario 'deleting context' do
    context = create(:context, name: 'My Context')

    visit context_path(context)
    click_link 'Delete Context'

    expect(page).not_to have_content 'My Context'
  end
end
